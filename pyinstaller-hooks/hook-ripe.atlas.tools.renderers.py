import os.path
import tempfile

from ripe.atlas.tools.renderers.base import Renderer
import ripe.atlas.tools.renderers

hiddenimports = []

mod = "ripe.atlas.tools.renderers.{}"
renderers = Renderer.get_available()
for renderer in renderers:
    hiddenimports.append(mod.format(renderer))

tmp_dir = tempfile.mkdtemp()
with open(os.path.join(tmp_dir, "renderers.list"), "w") as tmp:
    tmp.write(" ".join(renderers))

templates_dir = os.path.join(
    os.path.dirname(ripe.atlas.tools.renderers.__file__),
    "templates",
    "reports",
)
datas = [
    (tmp.name, ""),
    (
        os.path.join(templates_dir, "*"),
        "ripe/atlas/tools/renderers/templates",
    ),
]
