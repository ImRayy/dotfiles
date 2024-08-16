return {
	entry = function()
		local h = cx.active.current.hovered
		local img_extensions = { "jpg", "jpeg", "png", "gif" }
		local file_extension = h.name:match("([^.]+)$")
		local done = false

		local function swww_cmd(img_path)
			os.execute(
				string.format(
					"swww img %s --transition-fps 60 --transition-duration 2 --transition-type left --transition-bezier 0.25,1,0.5,1",
					img_path
				)
			)
		end

		-- Cheks whether swww-daemon is running, if not starts
		local function sww_daemon_handler()
			local handle = io.popen("pgrep -x swww-daemon")

			if not handle then
				error("Error checking running process")
			end

			local result = handle:read("*a")
			handle:close()

			if result ~= "" then
				return
			end

			os.execute("notify-send 'swww-daemon not running, starting swww daemon'")
			os.execute("nohup swww-daemon > /dev/null 2>&1 & disown %1")
			os.execute("sleep 1")
			os.execute("notify-send 'swww-daemon started'")
		end

		-- Checks whether the given file's extension matches the img_extensions list
		for _, v in ipairs(img_extensions) do
			if v == file_extension then
				sww_daemon_handler()
				swww_cmd(h.url)
				done = true
				break
			end
		end

		if not done then
			os.execute("notify-send -u critical -t 5000 'Selected file is not a image file!'")
		else
			os.execute("sleep 1")
			os.execute("notify-send -t 2000 'Successfully set wallpaper!'")
		end
	end,
}
