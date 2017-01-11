SUBS = %w[
  the_comments_base
  the_comments_base
  git@github.com:TheComments/the_comments_base.git
  master

  the_comments_subscriptions
  the_comments_subscriptions
  git@github.com:TheComments/the_comments_subscriptions.git
  master

  the_comments_manager
  the_comments_manager
  git@github.com:TheComments/the_comments_manager.git
  master

  the_comments_antispam_services
  the_comments_antispam_services
  git@github.com:TheComments/the_comments_antispam_services.git
  master

  the_viking
  the_viking
  git@github.com:TheComments/the_viking.git
  master
].each_slice(4)

def submodule_add(name, path, repo, branch)
  puts cmd = "git submodule add -b #{branch} #{repo} #{ path }"
  puts `#{ cmd }`
end

def submodule_rm(name, path, repo, branch)
  puts cmd = "git submodule deinit #{ name }"
  puts `#{ cmd }`

  puts cmd = "git rm --cached #{ path }"
  puts `#{ cmd }`

  puts cmd = "rm -rf /modules/#{ path }"
  puts `#{ cmd }`

  puts cmd = "rm -rf #{ path }"
  puts `#{ cmd }`
end

def submodules_init
  puts cmd = "git submodule init"
  puts `#{ cmd }`
end

def submodules_update
  puts cmd = "git submodule update"
  puts `#{ cmd }`
end

def add_submodules
  SUBS.each do |sub|
    name   = sub[0]
    path   = sub[1]
    repo   = sub[2]
    branch = sub[3]

    submodule_add(name, path, repo, branch)
  end
end

def rm_submodules
  SUBS.each do |sub|
    name   = sub[0]
    path   = sub[1]
    repo   = sub[2]
    branch = sub[3]

    submodule_rm(name, path, repo, branch)
  end

  puts cmd = "git reset --hard"
  puts `#{ cmd }`
end

add_submodules
submodules_init
submodules_update
# rm_submodules
