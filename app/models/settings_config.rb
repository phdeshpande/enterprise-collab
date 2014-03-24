module SettingsConfig
  # VALUES
  ENABLED = 1
  DISABLED = 0

  # FORMATS
  DATE_FORMAT = "dd-mm-yy"

  STATUS = { ENABLED => "Active", DISABLED => "In-Active"}
  TASK_STATUS = { "Pending" => 1, "Progress" => 2, "Hold" => 3, "Done" => 4 }
  TASK_CATEGORIES = ["Team Activities", "Company Activities", "Coding", "Sales", "Testing", "Graphic Designing", "Knowledge Building", "Documentation", "Demo", "Planning"]
  
end