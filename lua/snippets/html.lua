local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("!", {
		t({ "<!DOCTYPE html>",
			"<html lang=\"en\">",
			"\t<head>",
			"\t\t<meta charset=\"UTF-8\" />",
			"\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />",
			"\t\t<title>" }),
		i(1),
		t({ "</title>",
			"\t</head>",
			"\t<body>", "",
			"\t</body>",
			"</html>"
		}),
	}),
}
