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
    pass
