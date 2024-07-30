import { CodeDiagnostic } from "./codeDiagnostic";
import { CommentItemModel } from "./commentItemModel";
import { StructuredToken } from "./structuredToken";

export enum CodePanelRowDatatype {
    CodeLine = "codeLine",
    Documentation = "documentation",
    Diagnostics = "diagnostics",
    CommentThread = "commentThread"
}

export class CodePanelRowData {
    type: string;
    lineNumber: number;
    rowOfTokens: StructuredToken[];
    nodeId: string;
    nodeIdHashed: string;
    rowPositionInGroup: number;
    associatedRowPositionInGroup: number;
    rowOfTokensPosition: string;
    rowClasses: Set<string>;
    indent: number;
    diffKind: string;
    toggleDocumentationClasses: string;
    toggleCommentsClasses: string;
    diagnostics: CodeDiagnostic;
    comments: CommentItemModel[];
    showReplyTextBox: boolean;
    isResolvedCommentThread: boolean;
    commentThreadIsResolvedBy: string;
    isHiddenAPI: boolean;
  
    constructor() {
        this.type = '';
        this.lineNumber = 0;
        this.rowOfTokens = [];
        this.nodeId = '';
        this.nodeIdHashed = '';
        this.rowPositionInGroup = 0;
        this.associatedRowPositionInGroup = 0;
        this.rowOfTokensPosition = '';
        this.rowClasses = new Set<string>();
        this.indent = 0;
        this.diffKind = '';
        this.toggleDocumentationClasses = '';
        this.toggleCommentsClasses = '';
        this.diagnostics = new CodeDiagnostic();
        this.comments = [];
        this.showReplyTextBox = false;
        this.isResolvedCommentThread = false;
        this.commentThreadIsResolvedBy = '';
        this.isHiddenAPI = false;
    }
}