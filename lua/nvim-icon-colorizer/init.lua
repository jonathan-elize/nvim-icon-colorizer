local M = {}

M.config = {
  enable_theme_switching_autocmd = true,
  colors = {
    theme1 = "Identifier",      --#e6c384
    theme2 = "Type",            --#7aa89f
    theme3 = "String",          --#98bb6c
    theme4 = "Special",         --#7fb4ca
    theme5 = "Boolean",         --#ffa066
    theme6 = "DiagnosticError", --#e82424
    theme7 = "Statement",       --#957fb8
  },
  theme_icons = {
    theme1 = {
      "Default",
      "Cobol",
      "Cobol",
      "Coffee",
      "Conf",
      "ConfigRu",
      "Cp",
      "Cpp",
      "Cobol",
      "Crystal",
      "Cs",
      "Csh",
      "Cson",
      "Css",
      "Csv",
      "Cxx",
      "D",
      "Dart",
      "Db",
      "DesktopEntry",
      "Diff",
      "Pdf",
      "Php",
      "Pl",
      "Pm",
      "Png",
      "Pp",
      "Ppt",
      "Prolog",
      "PsScriptfile",
      "PsManifestfile",
      "PsScriptModulefile",
      "Js",
      "TestJs",
      "SpecJs",
    },
    theme2 = {
      "Jsx",
      "JavaScriptReactTest",
      "JavaScriptReactSpec",
      "Ai",
      "Awk",
      "Bash",
      "Bat",
      "Bmp",
      "C",
      "CPlusPlus",
      "Cobol",
      "CPlusPlus",
      "Configuration",
      "Cjs",
      "Clojure",
      "ClojureC",
      "ClojureJS",
      "ClojureDart",
      "CMake",
      "Rs",
      "Rss",
      "Sass",
      "sbt",
      "Scala",
      "Scheme",
      "Scss",
      "Sh",
      "Ksh",
      "Kotlin",
      "KotlinScript",
      "Leex",
      "Less",
      "Lhs",
      "License",
      "Makefile",
      "Makefile",
      "Makefile",
      "Markdown",
      "Material",
    },
    theme3 = {
      "Babelrc",
      "BashProfile",
      "Bashrc",
      "DsStore",
      "Eslintrc",
      "GitAttributes",
      "GitConfig",
      "GitIgnore",
      "GitlabCI",
      "GitModules",
      "Gvimrc",
      "NPMIgnore",
      "NPMrc",
      "SettingsJson",
      "Vimrc",
      "Zshprofile",
      "Zshenv",
      "Zshrc",
      "Brewfile",
      "CMakeLists",
      "GitCommit",
      "Dockerfile",
      "License",
      "License",
      "Dockerfile",
      "Dockerfile",
      "Dockerfile",
      "Gemfile",
      "License",
      "R",
      "Rmd",
      "Vagrantfile",
      "Gvimrc",
      "Vimrc",
      "PackageJson",
      "PackageLockJson",
      "NodeModules",
      "Favicon",
      "Makefile",
      "Makefile",
      "MixLock",
      "Env",
      "Gruntfile",
      "Gulpfile",
      "Webpack",
      "Rakefile",
      "Procfile",
      "Dockerfile",
      "Tsx",
      "TypeScriptReactTest",
      "TypeScriptReactSpec",
    },
    theme4 = {
      "Ts",
      "TestTs",
      "SpecTs",
      "Doc",
      "Docx",
      "Drools",
      "Dropbox",
      "Dump",
      "Edn",
      "Eex",
      "Ejs",
      "Elm",
      "Epp",
      "Erb",
      "Erl",
      "Ex",
      "Exs",
      "Fsharp",
      "Fortran",
      "Fennel",
      "Fish",
      "Fs",
      "Fsi",
      "Json",
      "Json5",
    },
    theme5 = {
      "Fsscript",
      "Fsx",
      "GDScript",
      "Gemspec",
      "Gif",
      "GitLogo",
      "BinaryGLTF",
      "Go",
      "GodotProject",
      "GraphQL",
      "GraphQL",
      "H",
      "Haml",
      "Hbs",
      "Heex",
      "Hh",
      "Hpp",
      "Hrl",
      "Hs",
      "Htm",
      "Html",
      "Hxx",
      "Ico",
      "ImportConfiguration",
      "Ini",
      "Java",
      "Jl",
      "Jpeg",
      "Jpg",
      "Md",
      "Mdx",
      "Mint",
      "Mjs",
      "Ml",
      "Mli",
      "Motoko",
      "Mustache",
      "Nim",
      "Nix",
      "OPUS",
      "OrgMode",
      "OpenTypeFont",
      "PackedResource",
    },
    theme6 = {
      "Twig",
      "Txt",
      "Verilog",
      "Vala",
      "Verilog",
      "VHDL",
      "VHDL",
      "Vim",
      "Vue",
      "Webmanifest",
      "Webp",
      "Webpack",
      "XcPlayground",
      "Xls",
      "Xlsx",
      "Xml",
      "Xul",
      "Yaml",
      "Yml",
      "Zig",
      "Zsh",
      "Solidity",
      "Prisma",
      "Lock",
      "Log",
      "Wasm",
      "Liquid",
      "TextScene",
    },
    theme7 = {
      "Sig",
      "Slim",
      "Sln",
      "Sml",
      "Sql",
      "Sql",
      "Sql",
      "Styl",
      "Suo",
      "Suo",
      "Psb",
      "Psd",
      "Py",
      "Pyc",
      "Pyd",
      "Pyo",
      "Query",
      "R",
      "Rake",
      "Rb",
      "Rlib",
      "Lua",
      "Luau",
      "Rmd",
      "Rproj",
      "SystemVerilog",
      "Svelte",
      "SystemVerilog",
      "Svg",
      "Swift",
      "Tor",
      "Tcl",
      "Tcl",
      "Terminal",
      "Tex",
      "Terraform",
      "TFVars",
      "Toml",
      "TextResource",
    },
  },
}

local util = require("icon-colorizer.util")

local create_default_icons = function(config)
  local icons = {}
  local numHighlightGroups = util.get_num_keys_from_table(config.colors)

  local icon_theme_map = {}
  for theme, icons_list in pairs(config.theme_icons) do
    for _, icon in ipairs(icons_list) do
      icon_theme_map[icon] = theme
    end
  end

  local i = 1
  local devicons = require("nvim-web-devicons").get_icons()
  for _, icon in pairs(devicons) do
    local theme_key = icon_theme_map[icon.name] or ("theme" .. i)
    local target_theme = config.colors[theme_key]

    local fg = util.hl(target_theme).fg
    icon.color = fg
    icons[icon.name] = icon

    if i == numHighlightGroups then
      i = 1
    else
      i = i + 1
    end
  end
  return icons
end

local set_icon_colors = function()
  local icons = create_default_icons(M.config)
  require("nvim-web-devicons").set_icon(icons)
end

M.setup = function(config)
  M.config = vim.tbl_extend("force", M.config, config or {})
  set_icon_colors()

  if M.config.enable_theme_switching_autocmd then
    local augroup = vim.api.nvim_create_augroup("IconColorizer", {})
    vim.api.nvim_clear_autocmds({ group = augroup })

    vim.api.nvim_create_autocmd("ColorScheme", {
      group = augroup,
      callback = set_icon_colors,
    })
  end
end

return M
