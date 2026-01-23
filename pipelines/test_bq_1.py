Config = {"country_code_x" : "'CN'"}
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

with DAG(Config = Config, schedules = Schedules):
    test_bq_1__Buffer_1 = Task(task_id = "test_bq_1__Buffer_1", component = "Model", modelName = "test_bq_1__Buffer_1")
