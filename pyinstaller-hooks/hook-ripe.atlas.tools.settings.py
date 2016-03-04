import os.path

import ripe.atlas.tools.settings

templates_dir = os.path.join(
    os.path.dirname(ripe.atlas.tools.settings.__file__),
    "templates",
)

datas = [
    (
        os.path.join(templates_dir, "*"),
        "ripe/atlas/tools/settings/templates",
    ),
]
