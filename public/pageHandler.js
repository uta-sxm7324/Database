function wrapper(open, close) {
    return (inner) => {
        return open + inner + close;
    }
}

const tw = wrapper("<table>","</table>");
const tr = wrapper("<tr>","</tr>");
const td = wrapper("<td>","</td>");
const th = wrapper("<th>","</th>")

function createTable(data) {
    console.log(data);
    return tw(
        tr(
            Object.keys(data[0]).reduce((acc, currentKey) => {
                return acc+th(currentKey)
            },"")
        ) +
        data.reduce((acc, val) => {
            return acc + tr(Object.values(val).reduce((acc, currentValue) => {
                return acc + td(currentValue);
            }, ""))
        }, '')
    )
}

function loadData(table, data) {
    const tableDiv = document.getElementById(table);
    if (!tableDiv) {
        console.log("Table " + table + " does not exist");
        return;
    }
    // Table exists, fill it with data
    tableDiv.innerHTML = createTable(data);
}