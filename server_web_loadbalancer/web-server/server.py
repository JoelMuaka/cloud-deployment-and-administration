#!/usr/bin/python3.7

import http.server
import socketserver
import socket
import os

PORT = 8080
hostname=socket.gethostname()
html = """<!DOCTYPE html>
<head>
    <title>My program</title>
</head>
<body>
    <p>Hostname : """+hostname+"""</p> 
</body>
</html>
"""

class CustomRequestHandler(http.server.SimpleHTTPRequestHandler):

    def do_GET(self):
        with open('./index.html', 'rb') as f:
            self.send_response(200)
            self.send_header('Content-Type', 'text/html; charset=utf-8')
            self.end_headers()
            self.wfile.write(f.read())
            self.wfile.write(bytes(html,"utf-8"))

httpd = socketserver.TCPServer(("", int(PORT)), CustomRequestHandler)
print("Python web server listening on port {}...".format(PORT))
httpd.serve_forever()
