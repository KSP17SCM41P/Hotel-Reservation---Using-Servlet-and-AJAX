var req;
var isIE;
var completeField;
var completeTable;
var autoRow;

function init() {
    completeField = document.getElementById("complete-field");
    completeTable = document.getElementById("complete-table");
    autoRow = document.getElementById("auto-row");
    completeTable.style.top = getElementY(autoRow) + "px";
}

function doCompletion() {
	debugger;
	init();
    var url = "AutoCompletion?action=complete&id=" + completeField.value;
    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}

function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function callback() {
    clearTable();

    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessages(req.responseXML);
        }
    }
}

function appendproduct(productName,productId) {
    var row;
    var cell;
    var linkElement;
    
    if (isIE) {
        completeTable.style.display = 'block';
        row = completeTable.insertRow(completeTable.rows.length);
        cell = row.insertCell(0);
    } else {
        completeTable.style.display = 'table';
        row = document.createElement("tr");
        cell = document.createElement("td");
        row.appendChild(cell);
        completeTable.appendChild(row);
    }

    cell.className = "popupCell";

    linkElement = document.createElement("a");
    linkElement.className = "popupItem";
    linkElement.setAttribute("href", "ViewSingleServlet?action=lookup&itemId=" + productName);
    linkElement.appendChild(document.createTextNode(productName));
    cell.appendChild(linkElement);
}

function clearTable() {
    if (completeTable.getElementsByTagName("tr").length > 0) {    	
        completeTable.style.display = 'none';
        for (var loop = completeTable.childNodes.length -1; loop >= 0 ; loop--) {        	
            completeTable.removeChild(completeTable.childNodes[loop]);
        }
    }
}

function getElementY(element){
    var targetTop = 0;
    
    if (element.offsetParent) {
        while (element.offsetParent) {
            targetTop += element.offsetTop;
            element = element.offsetParent;
        }
    } else if (element.y) {
        targetTop += element.y;
    }
    return targetTop;
}

function parseMessages(responseXML) {
    debugger;
    // no matches returned
    if (responseXML == null) {
        return false;
    } else {

        var products = responseXML.getElementsByTagName("hotels")[0];

        if (products.childNodes.length > 0) 
        {
            completeTable.setAttribute("bordercolor", "black");
            completeTable.setAttribute("border", "1");
    
            for (var loop = 0; loop < products.childNodes.length; loop++) {
                var product = products.childNodes[loop];
                var productName = product.getElementsByTagName("hotelName")[0];
                var productId = product.getElementsByTagName("hotelPrice")[0];
                appendproduct(productName.childNodes[0].nodeValue,                    
                    productId.childNodes[0].nodeValue);
            }
        }
    }
}