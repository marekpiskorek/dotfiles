require 'gitlinker'.setup({
  callbacks = {
    ["github.com"] = require "gitlinker.hosts".get_github_type_url,
    ["gitlab.com"] = require "gitlinker.hosts".get_gitlab_type_url,
    ["gitlab.codility.net"] = require "gitlinker.hosts".get_gitlab_type_url,
  }
})
