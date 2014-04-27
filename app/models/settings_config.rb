module SettingsConfig
  # VALUES
  ENABLED = 1
  DISABLED = 0

  # FORMATS
  DATE_FORMAT = "%d-%m-%Y %H:%M:%S"

  STATUS = { ENABLED => "Active", DISABLED => "In-Active"}
  PM_USER_STATUS = { 1 => "Invited", 2 => "Active", 3 => "Deleted" }
  PM_SPACE_STATUS = { 0 => "Proposed", 1 => "Active", 2 => "Archived", 3 => "Proposed", 4 => "Shared" }
  TASK_STATUS = { "Pending" => 1, "Progress" => 2, "Hold" => 3, "Done" => 4 }
  TASK_PRIORITY = { "Low" => 1, "Normal" => 2, "High" => 3, "Highest" => 4 }
  TASK_CATEGORIES = {"Team Activities" => 1, "Company Activities" => 2, "Coding" => 3, "Sales" => 4} #, "Testing", "Graphic Designing", "Knowledge Building", "Documentation", "Demo", "Planning"]

  ROLES = %w[sys admin chief manager lead senior contract]
  
end