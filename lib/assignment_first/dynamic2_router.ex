import AssignmentFirst
defmodule Dynamic2.Router do
  import Plug.Conn
  use Plug.Router
  require EEx
  plug :match
  plug :dispatch
  get "/" do
    body=EEx.eval_file "lib/assignment_first/dynamic2.leex",[display: display()]
    send_resp(conn, 200, body)
  end
  get "/add" do
    conn = Plug.Conn.fetch_query_params(conn)
 		task = Map.fetch!(conn.params, "data")
    add(task)
    body=EEx.eval_file "lib/assignment_first/dynamic2.leex",[display: display()]
    send_resp(conn, 200, body)
  end
  get "/delete" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "delete_data")
     delete_task(id)
    body=EEx.eval_file "lib/assignment_first/dynamic2.leex",[display: display()]
    send_resp(conn, 200, body)
  end
  get "/edittt" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "id")
    body=EEx.eval_file "lib/assignment_first/edit_only.eex",[id: id,display: display()]
    send_resp(conn, 200, body)
  end
  get "/edit" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "id")
    task = Map.fetch!(conn.params, "edit_data")
    update_task(id,task,"high")
    body=EEx.eval_file "lib/assignment_first/dynamic2.leex",[display: display()]
    send_resp(conn, 200, body)
  end

end
