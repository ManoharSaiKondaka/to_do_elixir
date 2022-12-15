#import Glue.Conn
import AssignmentFirst
defmodule Assignment.Try2.Router do
  import Plug.Conn
  use Plug.Router
  require EEx
  plug :match
  plug :dispatch
  get "/" do
    body=EEx.eval_file "lib/assignment_first/later.eex",[a: 400,c: display_task(),b: display_id(),d: display_status()]
    send_resp(conn, 200, body)
  end
  
  get "/add" do
    conn = Plug.Conn.fetch_query_params(conn)
 		task = Map.fetch!(conn.params, "data")
    add(task)
    body=EEx.eval_file "lib/assignment_first/later.eex",[a: 400,c: display_task(),b: display_id(),d: display_status()]
    send_resp(conn, 200, body)

  end
  get "/toggle" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "id")
    status = Map.fetch!(conn.params, "status")
    toggle_status(id,status)
    body=EEx.eval_file "lib/assignment_first/later.eex",[a: 400,c: display_task(),b: display_id(),d: display_status()]
    send_resp(conn, 200, body)

  end
  get "/delete" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "delete_data")
    if length(len()) >4 do
      delete_task(id)
    end
    body=EEx.eval_file "lib/assignment_first/later.eex",[a: 400,c: display_task(),b: display_id(),d: display_status()]
    send_resp(conn, 200, body)
  end
  get "/edit" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "id")
    task = Map.fetch!(conn.params, "edit_data")
    update_task(id,task)
    body=EEx.eval_file "lib/assignment_first/later.eex",[a: 400,c: display_task(),b: display_id(),d: display_status()]
    send_resp(conn, 200, body)
  end
  get "/edittt" do
    conn = Plug.Conn.fetch_query_params(conn)
 		id = Map.fetch!(conn.params, "id")
    body=EEx.eval_file "lib/assignment_first/edit_only.eex",[id: id,c: display_task(),b: display_id(),d: display_status()]
    send_resp(conn, 200, body)
  end
  get "/edit3" do
    conn = Plug.Conn.fetch_query_params(conn)
    id = Map.fetch!(conn.params, "id")
    task = Map.fetch!(conn.params, "edit_data")
    update_task(id,task)
    body=EEx.eval_file "lib/assignment_first/later.eex",[a: 400,c: display_task(),b: display_id(),d: display_status()]
    send_resp(conn, 200, body)
  end

end
