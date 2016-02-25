require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.create(fname:'John', lname:'Smith',email: "jsmith@aol.com")
    @bug =  Bug.create(title:"an issue", description:"This is a description", user_id: 1)
  end
  
  test "must be a valid bug" do
    assert @bug.valid?
  end
  
  test "title must not be blank" do
    @bug.title = ""
    assert_not @bug.valid?
  end
  
  test "description must not be blank" do
    @bug.description = ""
    assert_not @bug.valid?
  end
  
  test "item type default must be a feature" do
    assert_equal "feature", @bug.issue_type
  end
  
   test "priority default must be a medium" do
    assert_equal "medium", @bug.priority
  end
  
   test "status default must be a open" do
    assert_equal "open", @bug.status
  end
  
    test "status must be valid" do   
    invalid_statuses = [-10, -1, 3, 10]    
    invalid_statuses.each do |is|        
      begin            
       @bug.status = is            
       assert false, "#{is} should be invalid"       
      rescue            
        assert true        
      end   
    end
  end
  
    
    test "issue type must be valid" do   
    invalid_issue_types = [-10, -1, 3, 10]    
    invalid_issue_types.each do |is|        
      begin            
       @bug.issue_type = is            
       assert false, "#{is} should be invalid"       
      rescue            
        assert true        
      end   
    end
  end
  
    
    test "priority must be valid" do   
    invalid_priorites = [-10, -1, 3, 10]    
    invalid_priorites.each do |is|        
      begin            
       @bug.priority = is            
       assert false, "#{is} should be invalid"       
      rescue            
        assert true        
      end   
    end
  end

end
