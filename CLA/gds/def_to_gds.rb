include RBA

options = RBA::LoadLayoutOptions.new
cfg = options.lefdef_config

cfg.lef_files = [
  "OpenROAD/test/sky130hd/sky130_fd_sc_hd_merged.lef"
]

cfg.read_lef_with_def = true

options.lefdef_config = cfg

layout = RBA::Layout.new
layout.read(
  "cla.def",
  options
)

layout.write(
  "cla.gds"
)
