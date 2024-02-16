local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	print("gitsigns is not installed")
	return
end

gitsigns.setup()
