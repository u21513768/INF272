function addModuleInfo() {
    var modInfoArr = [];
    var code = document.getElementById("modInfoCode").value;
    var lecturer = document.getElementById("modLecturer").value;
    var id = Date.now();
    var modInfoObj = {code: code, lecturer: lecturer, id: id};

    //window.alert(id);
    
    if (code.length > 0 && lecturer.length > 0)
    {
        var table = document.getElementById("infoTable");
        var rowCount = table.rows.length;
        var select = document.getElementById("listCode");

        for (var i = 1; i < rowCount; i++) 
        {
            if (table.rows[i].cells[0].innerHTML == code)
            {
                window.alert("Module has already been added!");
                return;
            }
        }

        table.innerHTML += `
            <tr>
                <td>${modInfoObj.code}</td>
                <td>${modInfoObj.lecturer}</td>
            </tr>
        `;

        var option = document.createElement("option");
        option.text = code;
        option.value = modInfoObj.code;
        select.appendChild(option);
        
        modInfoArr.push(modInfoObj);
        console.log(modInfoArr);
    }
    else
    {
        window.alert('Please fill in details before selecting "Add".');
    }
}

var taskArrGL;

function addTask() {
    var taskArr = [];
    var taskName = document.getElementById("taskName").value;
    var taskDate = document.getElementById("dueDate").value;
    var id = Date.now();
    var taskObj = {task: taskName, date: taskDate, id: id};
    var currDate = new Date();

    if (!taskDate)
    {
        window.alert("Please pick a date for your task.")
        return;
    }

    if (taskName.length > 0)
    {
        var table = document.getElementById("taskTable");
        var rowCount = table.rows.length;
        var select = document.getElementById("task");

        for (var i = 1; i < rowCount; i++) 
        {
            if (table.rows[i].cells[0].innerHTML == taskName)
            {
                window.alert("Task has already been added!");
                return;
            }
        }

        table.innerHTML += `
            <tr>
                <td>${taskObj.task}</td>
                <td>${taskObj.date}</td>
            </tr>
        `;

        var option = document.createElement("option");
        option.text = taskName;
        option.value = taskObj.id;
        select.appendChild(option);
        
        taskArr.push(taskObj);
        console.log(taskArr);
    }
    else
    {
        window.alert('Please fill in details before selecting "Add".');
    }

    taskArrGL = taskArr;
}

function addToDoList() {
    var listArr = [];
    var code = document.getElementById("listCode").value;
    var taskName;
    var taskDate;

    if (taskArrGL.length > 0)
    {
        for (var i = 0; i < taskArrGL.length; i++)
        {
            if (taskArrGL[i].id == document.getElementById("task").value)
            {
                taskDate = taskArrGL[i].date;
                taskName = taskArrGL[i].task;
            }
        }
    }

    if (!taskDate || !code)
    {
        window.alert("Please add the relevant tasks using the 'Task' form, as well as the ",
        "relevant modules using the 'Module Information' form before progressing, then try again.")
    }
    
    var desc = document.getElementById("description").value;
    var id = Date.now();
    var listObj = {code: code, task: taskName, date: taskDate, desc: desc, id: id};

    if (desc.length > 0)
    {
        var table = document.getElementById("listTable");
        var rowCount = table.rows.length;

        for (var i = 1; i < rowCount; i++) 
        {
            if (table.rows[i].cells[0].innerHTML == taskName)
            {
                window.alert("Task has already been added!");
                return;
            }
        }

        table.innerHTML += `
            <tr>
                <td>${listObj.code}</td>
                <td>${listObj.task}</td>
                <td>${listObj.desc}</td>
                <td>${listObj.date}</td>
            </tr>
        `;

        table.lastChild.classList.add("toDoRow")

        listArr.push(listObj);
        console.log(listArr);
    }
    else
    {
        window.alert('Please fill in details before selecting "Add".');
    }
}

function removeList(o) {
    delete o;
}