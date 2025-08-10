local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

return {
	s({ trig = "sdl%s+([^%s]+)", regTrig = true }, {
		t({
			"if (!SDL_Init(SDL_INIT_VIDEO)) {",
			"\tSDL_Log(\"SDL could not initialize! SDL_Error: %s\\n\", SDL_GetError());",
			"\treturn 1;",
			"}",""
		}),
		f(function(_, snip)
			return "SDL_Window* window = SDL_CreateWindow(\"" .. snip.captures[1] .. "\", 800, 600, 0);"
		end),
		t({
			"if (window == NULL) {",
			"\tSDL_Log(\"Window could not be created! SDL_Error: %s\\n\", SDL_GetError());",
			"\tSDL_Quit();",
			"\treturn 1;",
			"}", "",
			"SDL_Event e;",
			"int quit = 0;",
			"while (!quit) {",
			"\twhile (SDL_PollEvent(&e) != 0) {",
			"\t\tif (e.type == SDL_EVENT_QUIT) {",
			"\t\t\tquit = 1;",
			"\t\t}",
			"\t}",
			"}", "",
			"SDL_DestroyWindow(window);",
			"SDL_Quit();", "",
			"return 1;"
		}),
	})
}
