#!/usr/bin/env python3
import http.server
import json
import subprocess
import os

PORT = 3000
TOKEN_FILE = "/root/api_token"


def load_token():
    if os.path.exists(TOKEN_FILE):
        with open(TOKEN_FILE) as f:
            return f.read().strip()
    token = os.urandom(16).hex()
    with open(TOKEN_FILE, "w") as f:
        f.write(token)
    return token

TOKEN = load_token()

SERVICE_SCRIPTS = {
    "ssh": "ssh/addssh.sh",
    "wireguard": "wireguard/addwg.sh",
    "sstp": "sstp/addsstp.sh",
    "shadowsocks": "shadowsocks/addss.sh",
    "ssr": "ssr/addssr.sh",
    "trojongo": "trojango/addtrgo.sh",
    "vless": "xray/addvless.sh",
    "vmess": "xray/addv2ray.sh",
    "trojan": "xray/addtrojan.sh"
}

class Handler(http.server.BaseHTTPRequestHandler):
    def _send(self, code, body):
        self.send_response(code)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(body).encode())

    def _check_auth(self):
        auth = self.headers.get("Authorization", "")
        if auth.startswith("Bearer "):
            token = auth[7:].strip()
            return token == TOKEN
        return False

    def do_POST(self):
        if not self._check_auth():
            self._send(401, {"error": "unauthorized"})
            return
        length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(length)
        try:
            data = json.loads(body)
        except Exception:
            data = {}
        service = self.path.lstrip("/")
        script = SERVICE_SCRIPTS.get(service)
        if not script:
            self._send(404, {"error": "unknown service"})
            return
        username = data.get("username")
        password = data.get("password")
        days = str(data.get("days", 1))
        if not username or not password:
            self._send(400, {"error": "missing parameters"})
            return
        cmd = f"printf '%s\n%s\n%s\n' '{username}' '{password}' '{days}' | bash {script}"
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        if result.returncode == 0:
            self._send(200, {"status": "success", "output": result.stdout})
        else:
            self._send(500, {"status": "error", "output": result.stderr})


def run():
    server = http.server.HTTPServer(("0.0.0.0", PORT), Handler)
    print(f"API server running on port {PORT}")
    server.serve_forever()


if __name__ == "__main__":
    run()
