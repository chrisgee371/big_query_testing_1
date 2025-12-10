Config = {"country_code_x" : "'CN'"}
Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)
SensorSchedule = SensorSchedule(enabled = False)

with DAG(Config = Config, Schedule = Schedule, SensorSchedule = SensorSchedule):
    test_bq_1__Buffer_1 = Task(task_id = "test_bq_1__Buffer_1", component = "Model", modelName = "test_bq_1__Buffer_1")
