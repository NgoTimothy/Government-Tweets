function cleanInputs() {
    var queryVal = document.getElementById("queryChoice").value;
    switch(queryVal.trim()) {
        case "a":
            removeAllInserts();
            removeSingleHash();
            removeListHash();
            removeListState();
            removeSubCat();
            removeListMonth();
            break;
        case "b":
            removeAllInserts();
            removeListHash();
            removeListState();
            removeSubCat();
            removeListMonth();
            break;
        case "c":
            removeAllInserts();
            removeSingleHash();
            removeListHash();
            removeListState();
            removeSubCat();
            removeListMonth();
            removeSingleMonth();
            break;
        case "d":
            removeAllInserts();
            removeSingleHash();
            removeListState();
            removeSubCat();
            removeListMonth();
            removeSingleMonth();
            removeSingleYear();
            break;
        case "e":
            removeAllInserts();
            removeSingleHash();
            removeSubCat();
            removeListHash();
            removeListMonth();
            removeMax();
            break;
        case "f":
            removeAllInserts();
            removeSingleHash();
            removeListHash();
            removeListMonth();
            removeMax();
            removeListState();
            break;
        case "g":
            removeAllInserts();
            removeSingleHash();
            removeListHash();
            removeListState();
            removeSingleMonth();
            break;
        case "h":
            removeAllInserts();
            removeSingleHash();
            removeListHash();
            removeListState();
            removeSingleMonth();
            removeSubCat();
            break;    
        case "i":
            removeMax();
            removeSingleHash();
            removeSingleMonth();
            removeSingleYear();
            removeListHash();
            removeListMonth();
            removeListState();
            removeSubCat();
            break; 
        case "j":
            removeMax();
            removeSingleHash();
            removeSingleMonth();
            removeSingleYear();
            removeListHash();
            removeListMonth();
            removeListState();
            removeSubCat();
            document.getElementById("realName").remove();
            document.getElementById("realName").remove();
            document.getElementById("subCatInsert").remove();
            document.getElementById("subCatInsert").remove();
            document.getElementById("cat").remove();
            document.getElementById("cat").remove();
            document.getElementById("state").remove();
            document.getElementById("state").remove();
            document.getElementById("followers").remove();
            document.getElementById("followers").remove();
            document.getElementById("following").remove();
            document.getElementById("following").remove();
            break;   
    }
    
}

function testFun() {
    alert("Testing");
}

function removeMax() {
    document.getElementById("maxResults").remove();
    document.getElementById("maxResults").remove();
}

function removeSingleMonth() {
    document.getElementById("monthGiven").remove();
    document.getElementById("monthGiven").remove();
}

function removeSingleYear() {
    document.getElementById("yearGiven").remove();
    document.getElementById("yearGiven").remove();
}

function removeSingleHash() {
    document.getElementById("hashGiven").remove();
    document.getElementById("hashGiven").remove();
}

function removeListHash() {
    document.getElementById("hashList").remove();
    document.getElementById("hashList").remove();
}

function removeListState() {
    document.getElementById("listState").remove();
    document.getElementById("listState").remove();
}

function removeSubCat() {
    document.getElementById("subCat").remove();
    document.getElementById("subCat").remove();
}

function removeListMonth() {
    document.getElementById("listMonth").remove();
    document.getElementById("listMonth").remove();
}

function removeAllInserts() {
    document.getElementById("screenName").remove();
    document.getElementById("screenName").remove();
    document.getElementById("realName").remove();
    document.getElementById("realName").remove();
    document.getElementById("subCatInsert").remove();
    document.getElementById("subCatInsert").remove();
    document.getElementById("cat").remove();
    document.getElementById("cat").remove();
    document.getElementById("state").remove();
    document.getElementById("state").remove();
    document.getElementById("followers").remove();
    document.getElementById("followers").remove();
    document.getElementById("following").remove();
    document.getElementById("following").remove();
}