Schedule = Schedule(cron = "* 0 2 * * * *", timezone = "GMT", emails = ["email@gmail.com"], enabled = False)
SensorSchedule = SensorSchedule(enabled = False)

with DAG(Schedule = Schedule, SensorSchedule = SensorSchedule):
    customer_orders = Task(
        task_id = "customer_orders", 
        component = "Dataset", 
        writeOptions = {"writeMode" : "overwrite"}, 
        table = {"name" : "customer_orders", "sourceType" : "Table", "sourceName" : "prophecy_field.abhinav_demos", "alias" : ""}
    )
    bronze_pipeline_cg1__bronze_retail_events_generator = Task(
        task_id = "bronze_pipeline_cg1__bronze_retail_events_generator", 
        component = "Model", 
        modelName = "bronze_pipeline_cg1__bronze_retail_events_generator"
    )
