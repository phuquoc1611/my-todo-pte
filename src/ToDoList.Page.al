page 90100 "MyCo ToDo List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "MyCo ToDo Item";
    Caption = 'ToDo List';
    Editable = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                }
                field(Completed; Rec.Completed)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MarkCompleted)
            {
                ApplicationArea = All;
                Caption = 'Mark Completed';
                Image = Approve;

                trigger OnAction()
                begin
                    Rec.Completed := true;
                    Rec.Modify(true);
                end;
            }
        }
    }
}
