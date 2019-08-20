workflow "Deploy" {
	resolves = ["WordPress Plugin Deploy"]
	on = "push"
}

# Filter for tag
action "tag" {
	uses = "actions/bin/filter@master"
	args = "tag"
}

action "WordPress Plugin Deploy" {
	needs = ["tag"]
	uses = "10up/actions-wordpress/dotorg-plugin-deploy@master"
	secrets = ["SVN_USERNAME", "SVN_PASSWORD", "GITHUB_TOKEN"]
	env = {
		SLUG = "nodeinfo"
	}
}
