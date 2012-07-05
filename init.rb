require 'redmine'
require 'dispatcher'
require 'issues4role_issue_patch'
require 'issues4role_role_patch'

Dispatcher.to_prepare do
  Issue.send(:include, Issues4RoleIssuePatch) unless Issue.include? Issues4RoleIssuePatch
  Role.send(:include, Issues4RoleRolePatch) unless Role.include? Issues4RoleRolePatch
end

Redmine::Plugin.register :redmine_issues4role do
  name 'Redmine Issues4role plugin'
  author 'Roman Shipiev'
  description 'Add item "role" to issues_visibility'
  version '0.0.1'
  url 'http://github.com/rubynovich/redmine_issues4role'
  author_url 'http://roman.shipiev.me'
end
