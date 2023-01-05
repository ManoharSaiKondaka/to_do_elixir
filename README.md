# to_do_elixir
This is a simple ToDo application that shows how to use Cowboy in conjunction with to create data driven Todo Applications.

This project has been developed using the following technologies:

Elixir 1.14
Plug - Cowboy 2.0
Ecto 3.1
Postgresql
HTML 5
CSS

SETUP:
1.Chnage the username and password of your postgres database in config/config.exs and config/test.exs
2.install the dependencies : $ mix deps.get
3. Create the database: $ mix ecto.create
4. Migrate the database: $ mix ecto.migrate
5. start the application: $mix run--no-halt
6. Start the localhost:8000 on browser
           (or)
6.  Start the localhost:8001 on browser
7. For unit testing uncomment the last line in config.exs and use command :$ -mix test
#FEATURES
1.Add Task
2.Add priority(optional.,default set to medium)
3.Delete task
4.Edit task and priority
5.Change staus to complete/incomplete



These are some example screenshots.

![image](https://user-images.githubusercontent.com/111751471/210235880-e0ab71bf-4116-41c8-8e95-25dc12dfe63c.png)

![image](https://user-images.githubusercontent.com/111751471/210236392-59d86cd6-160a-464e-bf71-0b789194c9fb.png)

![image](https://user-images.githubusercontent.com/111751471/210236522-0462bf91-4d79-42a9-aad2-8b9993e8b8e0.png)


                                             
            DATA BASE
![image](https://user-images.githubusercontent.com/111751471/210238429-21be86fc-2b15-4150-adf8-990d49312995.png)


