-- https://pycodestyle.pycqa.org/en/latest/intro.html#configuration
-- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
return {
	settings = {
        pyright = {
            plugins = {
                pycodestyle = {
                    ignore = {"E501", "E401", "E221", "E711"}
                },
                flake8 = {
                    ignore = {"F811"}   -- şu an çalışmıyor. pyflaketen gelen hataları ignore etmenin yollarına bakmak lazım.
                }
            }
        }
	},
}
