import os.path
import sys

from ripe.atlas.tools.commands.base import Command
from ripe.atlas.tools.renderers.base import Renderer

base_dir = os.path.dirname(sys.argv[0])

with open(os.path.join(base_dir, "commands.list")) as f:
    commands = f.read().strip().split()

with open(os.path.join(base_dir, "renderers.list")) as f:
    renderers = f.read().strip().split()

Command.get_available_commands = staticmethod(lambda: commands)

Renderer.get_available = staticmethod(lambda: renderers)
