return{

	cmd = { 'elp', 'server' },
	filetypes = { 'erlang' },
	root_markers = {'.elp.toml', 'build_info.json', '.git' },
	settings = {
		elp =   {
			diagnostics = {
				-- https://whatsapp.github.io/erlang-language-platform/docs/erlang-error-index
				disabled = {
					"W0052", -- Avoid catch      
					"W0053", -- logger deprecated
					"W0038", -- Edoc deprecated
					"W0023", -- Binary to Atom
					"W0051", -- Binary can be written ~"lol"
				}
			}
		}
	}
}
