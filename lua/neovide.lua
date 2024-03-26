--"https://neovide.dev/configuration.html"

-- note to self as of Monday, February 26, 2024, 10:33:49PM, neovide breaks whenever lua prints more than 1 line of text. idk why

if vim.g.neovide then

-- SETTINGS STUFF
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_fullscreen = true

-- FONT CONFIG --
	--vim.o.guifont = "font goes here"
	vim.opt.linespace = 0
	vim.g.neovide_scale_factor = 1.0

	vim.neovide_padding_top = 0
	vim.neovide_padding_bottom = 0
	vim.neovide_padding_left = 0
	vim.neovide_padding_right = 0


-- TRANSPARENCY STUFF --
	-- Helper function for transparency formatting
	local alpha = function()
	  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
	end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.neovide_transparency = 1
	--vim.g.neovide_transparency = 0.9
	vim.g.transparency = 0.8
	vim.g.neovide_background_color = "#0f1117" .. alpha()

	vim.g.neovide_floating_blur_ammount_x = 2.0
	vim.g.neovide_floating_blur_ammount_y = 2.0


-- CURSOR STUFF --
	vim.g.neovide_cursor_animation_length = 0.05
	vim.g.neovide_cursor_trail_size = 0.8
	vim.g.neovide_antialiasing = true
	vim.g.neovide_cursor_animate_in_insert_mode = true
	vim.g.neovide_cursor_animate_command_line = true
	vim.g.neovide_cursor_unfocused_outline_width = 0.125

	vim.g.neovide_cursor_vfx_mode = "sonicboom" -- railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
	vim.g.neovide_cursor_vfx_opacity = 200.0
	vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
	vim.g.neovide_cursor_vfx_particle_density = 10
	vim.g.neovide_cursor_vfx_particle_speed = 10.0
	--vim.g.neovide_cursor_vfx_particle_phase = 1.5 -- only for railgun mode
	--vim.g.neovide_cursor_vfx_particle_curl = 1.0 -- only for railgun mode
	
end
