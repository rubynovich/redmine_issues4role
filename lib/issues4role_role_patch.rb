require_dependency 'role'

module Issues4RoleRolePatch
  def self.included(base)
    base.extend(ClassMethods)
    
    base.send(:include, InstanceMethods)
    
    base.const_set("ISSUES_VISIBILITY_OPTIONS",
      Role::ISSUES_VISIBILITY_OPTIONS +
        [['role', :label_issues_visibility_role]])
    
    base.class_eval do
    end
  end
    
  module ClassMethods
  end
  
  module InstanceMethods
  end
end
