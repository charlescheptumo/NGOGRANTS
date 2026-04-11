// #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
// Codeunit 57009 "ProcessingResources"
// {

//     trigger OnRun()
//     begin
//         Message(GenerateSetterClaimForm('SCLAIM002'));
//     end;

//     var
//         FILESPATH: label 'C:\inetpub\wwwroot\MarkersPortal\downloads\';
//         FILESPATH1: label 'C:\inetpub\wwwroot\MarkersPortal\downloads\ClaimReport\';
//         FILESPATH2: label 'F:\Brian\Setters\downloads\SetterClaimForm\';
//         Resource: Record Resource;
//         SetterHeader: Record "Setter Header";
//         DisclosureTrainingInst: Record "Disclosure Training Inst";
//         DisclosureRelative: Record "Disclosure Relative";
//         DisclosurePaperSubmitted: Record "Disclosure Paper Submitted";

//     procedure GenerateClaimReport(refNo: Text) status: Text
//     var
//         ScriptsDispatchHeader: Record "Scripts Dispatch Header";
//     begin
//         ScriptsDispatchHeader.Reset;
//         ScriptsDispatchHeader.SetRange("Marker No", refNo);
//         if ScriptsDispatchHeader.FindSet then begin
//             //  if FILE.Exists(FILESPATH1+refNo+'.pdf') then begin
//             //         FILE.Erase(FILESPATH1+refNo+'.pdf');
//             //         //Report.SaveAsPdf(85198, FILESPATH1+refNo+'.pdf',ScriptsDispatchHeader);
//             //         status:='success*Generated*Downloads\ClaimReport\'+refNo+'.pdf';
//             //  end else begin
//             //         //Report.SaveAsPdf(85198, FILESPATH1+refNo+'.pdf',ScriptsDispatchHeader);
//             //         status:='success*Generated*Downloads\ClaimReport\'+refNo+'.pdf';
//             // end
//         end else begin
//             status := 'danger*Document not found';
//         end
//     end;

//     procedure FnAddSetterQuestionLine(appNo: Code[50]; lineNo: Integer; reference: Text; knc: Integer; ana: Integer; enc: Integer) status: Text
//     var
//         SetterHeader: Record "Setter Header";
//         ExaminationReviewLines: Record "Examination Review Lines";
//     begin
//         SetterHeader.Reset;
//         SetterHeader.SetRange("Document No.", appNo);
//         if SetterHeader.FindSet then begin
//             ExaminationReviewLines.Reset;
//             ExaminationReviewLines.SetRange("Document No.", appNo);
//             ExaminationReviewLines.SetRange("Line No.", lineNo);
//             if ExaminationReviewLines.FindSet then begin
//                 //  ExaminationReviewLines.INIT;
//                 //  ExaminationReviewLines."Document No." := appNo;
//                 //  ExaminationReviewLines."Topic Code" := topic;
//                 //  ExaminationReviewLines.VALIDATE("Topic Code");
//                 //  ExaminationReviewLines."Setter Code" := SetterHeader."Examiner Code";
//                 //  ExaminationReviewLines.VALIDATE("Setter Code");
//                 //  ExaminationReviewLines."Line No." := lineNo;
//                 ExaminationReviewLines.References := reference;
//                 ExaminationReviewLines."Knowledge and Comprehension" := knc;
//                 ExaminationReviewLines."Application and Analysis" := ana;
//                 ExaminationReviewLines."Evaluation and Creativity" := enc;
//                 if ExaminationReviewLines.Modify(true) then begin
//                     status := 'success*Question details have been added successfully';
//                 end else begin
//                     status := 'danger*An error occured while adding question details';
//                 end
//             end else begin
//                 status := 'danger*Question could not be found';
//             end

//         end else begin
//             status := 'danger*Setter Specification header not found.';
//         end
//     end;

//     procedure FnaddSetterSpecificationHeader(examSitting: Code[50]; examination: Code[50]; level: Code[50]; levelCode: Code[50]; empNo: Code[10]) status: Text
//     var
//         SetterHeader: Record "Setter Header";
//     begin
//         SetterHeader.Init;
//         SetterHeader."Document Type" := SetterHeader."document type"::"Setter Specification";
//         SetterHeader."Examiner Code" := empNo;
//         SetterHeader.Validate("Examiner Code");
//         SetterHeader."Examination Sitting" := examSitting;
//         SetterHeader.Examination := examination;
//         SetterHeader.Level := level;
//         SetterHeader."Paper Code" := levelCode;
//         SetterHeader.Validate("Paper Code");
//         if SetterHeader.Insert(true) then begin
//             status := 'success*Setter specification crested succesfully*' + SetterHeader."Document No.";
//         end else begin
//             status := 'danger*Error occured while creating your setter specification';
//         end
//     end;

//     procedure GenerateSetterClaimForm(reqNo: Code[30]) status: Text
//     var
//         SetterHeader: Record "Setter Header";
//     begin
//         SetterHeader.Reset;
//         SetterHeader.SetRange("Document No.", reqNo);
//         if SetterHeader.FindSet then begin
//             //  if FILE.Exists(FILESPATH2+reqNo+'.pdf') then begin
//             //         FILE.Erase(FILESPATH2+reqNo+'.pdf');
//             //         //Report.SaveAsPdf(85402, FILESPATH2+reqNo+'.pdf',SetterHeader);
//             //         status:='success*Generated*Downloads\SetterClaimForm\'+reqNo+'.pdf';
//             //  end else begin
//             //         //Report.SaveAsPdf(85402, FILESPATH2+reqNo+'.pdf',SetterHeader);
//             //         status:='success*Generated*Downloads\SetterClaimForm\'+reqNo+'.pdf';
//             // end
//         end else begin
//             status := 'danger*Document not found';
//         end
//     end;

//     procedure FnInsertStudentMarks(examSitting: Text; paper: Code[30]; regNo: Code[30]; mark: Decimal) status: Text
//     var
//         MarksheetDetailedLines: Record "Marksheet Detailed Lines";
//     begin
//         MarksheetDetailedLines.Init;
//         MarksheetDetailedLines.SetRange("Examination Sitting ID", examSitting);
//         MarksheetDetailedLines.SetRange(Paper, paper);
//         MarksheetDetailedLines.SetRange("Student Reg No.", regNo);
//         if MarksheetDetailedLines.FindSet then begin
//             MarksheetDetailedLines.Mark := mark;
//             if MarksheetDetailedLines.Insert(true) then begin
//                 status := 'success*Student mark Inserted Successfully';
//             end else begin
//                 status := 'danger*An Error occured while entering student marks';
//             end
//         end else begin
//             status := 'danger*An error occured while inserting student marks';
//         end
//     end;

//     procedure FnRequestMarkerCredentials(IdNumber: Code[50]) status: Text
//     var
//         Resource: Record Resource;
//         MarkerPortalUser: Record "Internal Mail Issuance";
//         passwordOk: Boolean;
//         password: Integer;
//     begin
//         /*
//         Resource.RESET;
//         //Resource.SETRANGE("ID/Passport No",IdNumber);
//         //Resource.SETRANGE("Exam Task Type",Resource."Exam Task Type"::Marker);
//         Resource.SETRANGE("No.",'RES0700');
//         IF Resource.FINDSET THEN BEGIN
//           MarkerPortalUser.RESET;
//           MarkerPortalUser.SETRANGE(IdNo,IdNumber);
//           IF MarkerPortalUser.FINDSET THEN BEGIN
//             status:= 'danger*You already have an active markers account. Kindly Proceed to login to access the portal';
//             END ELSE BEGIN
//               passwordOk:= FALSE;
//               REPEAT
//               password:= RANDOM(9999);
//               IF password >1000 THEN
//                 passwordOk:=TRUE;
//               UNTIL passwordOk=TRUE;
//               MarkerPortalUser.INIT;
//               MarkerPortalUser.IdNo:= IdNumber;
//               MarkerPortalUser.password:= FORMAT(password);
//               MarkerPortalUser.MarkerNo := Resource."No.";
//               IF MarkerPortalUser.INSERT(TRUE) THEN BEGIN
//                 objMail.CreateMessage('Kasneb','support@kasneb.org', 'brayohorina@gmail.com', 'One Time Password', 'Your one time password is <strong>'+FORMAT(password)+'</strong>', TRUE);
//                 objMail.Send();
//                 //status:='success*We have sent a one time password to your email ('+Resource."E-Mail"+'). Use it to log in to your account';
//                 status:='success*We have sent a one time password to your email (brayohorina@gmail.com). Use it to log in to your account';
//                 END ELSE BEGIN
//                 END
//               END
        
//           END ELSE BEGIN
//             status:= 'danger*The given Identification number does not belong to any marker. Kindly Contact System Administrater for assistance.';
//             END
//             */

//     end;

//     procedure FnResetMarkerPassword(idNo: Code[10]) status: Text
//     var
//         MarkerPortalUser: Record "Internal Mail Issuance";
//         passwordOk: Boolean;
//         password: Integer;
//         Resource: Record Resource;
//     begin
//         /*
//         status:='danger*Account not found';
//         MarkerPortalUser.SETRANGE(IdNo,idNo);
//         //MarkerPortalUser.SETRANGE(changedPassword,FALSE);
//         IF MarkerPortalUser.FINDSET THEN BEGIN
//             passwordOk:= FALSE;
//               REPEAT
//               password:= RANDOM(9999);
//                 IF password >1000 THEN
//                   passwordOk:=TRUE;
//                 UNTIL passwordOk=TRUE;
//                 MarkerPortalUser.RESET;
//                 MarkerPortalUser.password:= FORMAT(password);
//                 MarkerPortalUser.changedPassword:= FALSE;
//                 MarkerPortalUser.MODIFY(TRUE);
//                   SMTPMailSetup.GET();
//                   objMail.CreateMessage(SMTPMailSetup."Email Sender Name",SMTPMailSetup."Email Sender Address", 'brayohorina@gmail.com', 'Password Reset', 'Your one time password is <strong>'+FORMAT(password)+'</strong>', TRUE);
//                   objMail.Send();
//             status:='success*We have sent a one time password to your email (brayohorina@gmail.com). Use it to log in to your account';
//           //status:='danger*You have not added company email to the selected employee. Kindly update and try again';
//           END ELSE BEGIN
//             status:='danger*Account with the given credentials does not exist';
//             END;
//             */

//     end;

//     procedure FnCreateSetterHeader(setterNumber: Code[50]; texamSitting: Code[50]) status: Text
//     begin
//         Resource.Reset;
//         Resource.SetRange("No.", setterNumber);
//         if Resource.FindSet then begin
//             SetterHeader.Init;
//             SetterHeader."Document Type" := SetterHeader."document type"::"Setter Disclosure";
//             SetterHeader."Examination Sitting" := texamSitting;
//             SetterHeader."Examiner Code" := setterNumber;
//             SetterHeader.Validate("Examiner Code");
//             SetterHeader."ID No." := Resource."ID/Passport No";
//             SetterHeader."Phone No." := Resource."M-Pesa Number";
//             //SetterHeader."No. of Papers" := tnoPapers;
//             if SetterHeader.Insert(true) then begin
//                 status := 'success*Setter introductory details have been added successfully*' + SetterHeader."Document No.";
//             end else begin
//                 status := 'danger*An error occured while adding setter introductory details';
//             end

//         end else begin
//             status := 'danger*Setter with Id ' + setterNumber + ' could not be found in the system. Kindly contact the sytem adminstrator for help.';
//         end
//     end;

//     procedure CreateDisclosurePapers(docNo: Code[50]; exam: Code[50]; level: Code[50]; paperCode: Code[50]) status: Text
//     var
//         DisclosurePapers: Record "Disclosure Papers";
//     begin
//         SetterHeader.Reset;
//         SetterHeader.SetRange("Document No.", docNo);
//         if SetterHeader.FindSet then begin
//             DisclosurePapers.Init;
//             DisclosurePapers."Document No." := docNo;
//             DisclosurePapers.Examination := exam;
//             DisclosurePapers.Validate(Examination);
//             DisclosurePapers.Level := level;
//             DisclosurePapers."Paper Code" := paperCode;
//             DisclosurePapers.Validate("Paper Code");
//             if DisclosurePapers.Insert(true) then begin
//                 status := 'success* Paper has been added successfully';
//             end else begin
//                 status := 'danger*An error occured while adding paper';
//             end
//         end else begin
//             status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
//         end
//     end;

//     procedure CreateDisclosureInstitutions(docNo: Code[50]; institution: Code[50]; dateCommenced: Date) status: Text
//     var
//         DisclosureTrainingInst: Record "Disclosure Training Inst";
//     begin
//         SetterHeader.Reset;
//         SetterHeader.SetRange("Document No.", docNo);
//         if SetterHeader.FindSet then begin
//             DisclosureTrainingInst.Init;
//             DisclosureTrainingInst."Document No." := docNo;
//             DisclosureTrainingInst."Institution Code" := institution;
//             DisclosureRelative.Validate("Institution Code");
//             DisclosureTrainingInst.Validate("Institution Code");
//             DisclosureTrainingInst."Date Commenced Training" := dateCommenced;
//             if DisclosureTrainingInst.Insert(true) then begin
//                 status := 'success*Institution has been added successfully';
//             end else begin
//                 status := 'danger*An error occured while adding disclosure Institution';
//             end
//         end else begin
//             status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
//         end
//     end;

//     procedure CreateDisclosureRelatives(docNo: Code[50]; relativeName: Text; relationship: Option; studRegNo: Text; course: Code[50]) status: Text
//     begin
//         SetterHeader.Reset;
//         SetterHeader.SetRange("Document No.", docNo);
//         if SetterHeader.FindSet then begin
//             DisclosureRelative.Init;
//             DisclosureRelative."Document No." := docNo;
//             DisclosureRelative."Name of Relative" := relativeName;
//             DisclosureRelative.Relationship := relationship;
//             DisclosureRelative."Student Reg No." := studRegNo;
//             DisclosureRelative.Course := course;
//             if DisclosureRelative.Insert(true) then begin
//                 status := 'success* Relative has been added successfully';
//             end else begin
//                 status := 'danger*An error occured while adding relative';
//             end
//         end else begin
//             status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
//         end
//     end;

//     procedure CreateDisclosureOther(docNo: Code[10]; institution: Code[50]; interest: Text) status: Text
//     begin
//         SetterHeader.Reset;
//         SetterHeader.SetRange("Document No.", docNo);
//         if SetterHeader.FindSet then begin
//             DisclosureRelative.Init;
//             DisclosureRelative."Document No." := docNo;
//             DisclosureRelative."Institution Code" := institution;
//             DisclosureRelative.Validate("Institution Code");
//             DisclosureRelative."Nature of Interest" := interest;
//             if DisclosureRelative.Insert(true) then begin
//                 status := 'success* Relative has been added successfully';
//             end else begin
//                 status := 'danger*An error occured while adding disclosure';
//             end
//         end else begin
//             status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
//         end
//     end;

//     procedure CreateDisclosureSubmittedPapers(docNo: Code[50]; exam: Code[50]; level: Code[50]; paperCode: Code[50]; questionNumber: Integer; topicCode: Code[50]) status: Text
//     begin
//         SetterHeader.Reset;
//         SetterHeader.SetRange("Document No.", docNo);
//         if SetterHeader.FindSet then begin
//             DisclosurePaperSubmitted.Init;
//             DisclosurePaperSubmitted."Document No." := docNo;
//             DisclosurePaperSubmitted.Examination := exam;
//             DisclosurePaperSubmitted.Validate(Examination);
//             DisclosurePaperSubmitted.Level := level;
//             DisclosurePaperSubmitted."Paper Code" := paperCode;
//             DisclosurePaperSubmitted.Validate("Paper Code");
//             DisclosurePaperSubmitted."Question No." := questionNumber;
//             DisclosurePaperSubmitted."Topic Code" := topicCode;
//             DisclosurePaperSubmitted.Validate("Topic Code");
//             if DisclosurePaperSubmitted.Insert(true) then begin
//                 status := 'success* Disclosure Submitted paper has been added successfully';
//             end else begin
//                 status := 'danger*An error occured while adding disclosure submitted paper';
//             end
//         end else begin
//             status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
//         end
//     end;

//     procedure CreateDeclaration(docNo: Code[50]) status: Text
//     begin
//         SetterHeader.Reset;
//         SetterHeader.SetRange("Document No.", docNo);
//         if SetterHeader.FindSet then begin
//             SetterHeader.Declaration := true;
//             SetterHeader."Declaration Date" := CurrentDatetime;
//             //  SetterHeader.Submitted := TRUE;
//             //  SetterHeader."Submitted By" := ;
//             //  SetterHeader."Submitted On" := CURRENTDATETIME;
//             if SetterHeader.Modify(true) then begin
//                 status := 'success*Your declaration form has been submitted successfully';
//             end else begin
//                 status := 'danger*An error occured while submitting your declaration form.';
//             end
//         end else begin
//             status := 'danger*Setter disclosure form number' + docNo + 'could not be found';
//         end
//     end;

//     procedure SubmitQuestionDetails(docNo: Code[10]; setterNo: Code[10]) status: Text
//     begin
//         SetterHeader.Reset;
//         SetterHeader.SetRange("Document No.", docNo);
//         if SetterHeader.FindSet then begin
//             SetterHeader.Submitted := true;
//             SetterHeader."Submitted On" := CurrentDatetime;
//             SetterHeader."Submitted By" := setterNo;
//             if SetterHeader.Modify(true) then begin
//                 status := 'success*Specification form has been submitted successfully';
//             end else begin
//                 status := 'danger*An error occured while submitting specification form';
//             end

//         end else begin
//             status := 'danger*Document not found';
//         end
//     end;
// }

