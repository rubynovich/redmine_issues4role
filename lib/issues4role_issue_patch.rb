require_dependency 'issue'

module Issues4RoleIssuePatch
  def self.included(base)
    base.extend(ClassMethods)
    
    base.send(:include, InstanceMethods)
    
    base.class_eval do
      class << self
        alias_method_chain :visible_condition, :issues4role
      end
    end
  end
    
  module ClassMethods
    def visible_condition_with_issues4role(user, options={})
      Project.allowed_to_condition(user, :view_issues, options) do |role, user|
        case role.issues_visibility
        when 'role'
          user_ids = [user.id] + role.members.map(&:user_id)
          "(#{table_name}.author_id = #{user.id} OR #{table_name}.assigned_to_id IN (#{user_ids.join(',')}))"                    
        else
          self.visible_condition_without_issues4role(user, options)
        end
      end
    end
  end
  
  module InstanceMethods
  end
end
