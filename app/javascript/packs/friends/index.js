import axios from "axios";


axios.get("https://jsonplaceholder.typicode.com/todos").then((response) => {
  console.log(response.data)
})


console.log("Script Loaded!");