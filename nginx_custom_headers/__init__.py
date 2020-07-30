import logging
import sys

from aiohttp import web

logging.basicConfig(stream=sys.stdout, level=logging.DEBUG)
logger = logging.getLogger(__name__)


async def get_headers(request: web.Request) -> web.Response:
    return web.json_response(data=dict(request.headers))


def create_app() -> web.Application:
    logger.info("Building app started")
    app = web.Application()
    app.add_routes([web.get(path="/api", handler=get_headers)])
    logger.info("App was built successfully")
    return app
