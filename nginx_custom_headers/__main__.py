from aiohttp import web

from nginx_custom_headers import create_app

if __name__ == "__main__":
    app = create_app()
    web.run_app(app, port=80)
