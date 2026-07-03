codeunit 90100 "MyCo ToDo Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    begin
        InsertSampleData();
    end;

    local procedure InsertSampleData()
    var
        ToDoItem: Record "MyCo ToDo Item";
    begin
        if not ToDoItem.IsEmpty() then
            exit;

        InsertOne('Chuẩn bị demo AL-Go for GitHub', Today() + 1, Enum::"MyCo ToDo Priority"::High);
        InsertOne('Cấu hình secrets cho repo', Today() + 3, Enum::"MyCo ToDo Priority"::Medium);
        InsertOne('Đọc tài liệu settings.json', Today() + 7, Enum::"MyCo ToDo Priority"::Low);
    end;

    local procedure InsertOne(Description: Text[100]; DueDate: Date; Priority: Enum "MyCo ToDo Priority")
    var
        ToDoItem: Record "MyCo ToDo Item";
    begin
        ToDoItem.Init();
        ToDoItem.Description := Description;
        ToDoItem."Due Date" := DueDate;
        ToDoItem.Priority := Priority;
        ToDoItem.Insert(true);
    end;
}
