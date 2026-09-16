include RBA

options = RBA::LoadLayoutOptions.new
cfg = options.lefdef_config

cfg.lef_files = [
  "/home/kavon05/hdl/OpenROAD/test/sky130hd/sky130_fd_sc_hd_merged.lef"
]

cfg.read_lef_with_def = true

options.lefdef_config = cfg

layout = RBA::Layout.new
layout.read(
  "/mnt/c/Users/KARAN DIWAN/HPA/CLA/src/cla_final.def",
  options
)

layout.write(
  "/mnt/c/Users/KARAN DIWAN/HPA/CLA/src/cla_final.gds"
)
