Schedules = [Schedule(
               Name = "Schedule 1", 
               emails = ["email@gmail.com"], 
               emailOnStart = False, 
               emailOnFailure = False, 
               emailOnSuccess = False, 
               enabled = False, 
               cron = "* 0 2 * * * *", 
               timezone = "GMT"
             )]

with DAG(schedules = Schedules):
    customer_orders = Task(
        task_id = "customer_orders", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "customer_orders", "sourceType" : "Table", "sourceName" : "prophecy_field.abhinav_demos", "alias" : ""}
    )
