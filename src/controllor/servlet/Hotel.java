package controllor.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import controllor.action.event.AdminEventAddAction;
import controllor.action.event.AdminEventDeleteAction;
import controllor.action.event.AdminEventListAction;
import controllor.action.event.AdminEventUpdateAction;
import controllor.action.event.EventAction;
import controllor.action.event.EventCheckDeleteAction;
import controllor.action.event.EventCheckInfo;
import controllor.action.event.EventDetailAction;
import controllor.action.event.EventListAction;
import controllor.action.member.AdminGotoShowMemberInsert;
import controllor.action.member.AdminGotoShowmember;
import controllor.action.member.AdminLoginAction;
import controllor.action.member.AdminLoginsuccessAction;
import controllor.action.member.AdminMemberDelete;
import controllor.action.member.AdminUpdateMember;
import controllor.action.member.ConsumerUpdateMember;
import controllor.action.member.LoginAction;
import controllor.action.member.MemberDelete;
import controllor.action.member.MemberInfoUpdate;
import controllor.action.member.MemberListAction;
import controllor.action.member.Myinfo;
import controllor.action.member.RegionAction;
import controllor.action.member.ShowGotoMemberDelete;
import controllor.action.member.UserInformation;
import controllor.action.member.UserLogout;
import controllor.action.member.UserPwQuestion;
import controllor.action.noticeboard.AdminNoticeBoardAddAction;
import controllor.action.noticeboard.AdminNoticeBoardDeleteAction;
import controllor.action.noticeboard.AdminNoticeBoardDeleteCheckView;
import controllor.action.noticeboard.AdminNoticeBoardDetailAction;
import controllor.action.noticeboard.AdminNoticeBoardListAction;
import controllor.action.noticeboard.AdminNoticeBoardModifyAction;
import controllor.action.noticeboard.AdminNoticeBoardModifyView;
import controllor.action.noticeboard.NoticeBoardAddAction;
import controllor.action.noticeboard.NoticeBoardDeleteAction;
import controllor.action.noticeboard.NoticeBoardDeleteCheckView;
import controllor.action.noticeboard.NoticeBoardDetailAction;
import controllor.action.noticeboard.NoticeBoardListAction;
import controllor.action.noticeboard.NoticeBoardModifyAction;
import controllor.action.noticeboard.NoticeBoardModifyView;
import controllor.action.qnaboard.AdminQnaBoardAddAction;
import controllor.action.qnaboard.AdminQnaBoardDeleteAction;
import controllor.action.qnaboard.AdminQnaBoardDeleteCheckView;
import controllor.action.qnaboard.AdminQnaBoardDetailAction;
import controllor.action.qnaboard.AdminQnaBoardListAction;
import controllor.action.qnaboard.AdminQnaBoardModifyAction;
import controllor.action.qnaboard.AdminQnaBoardModifyView;
import controllor.action.qnaboard.AdminQnaBoardReplyAction;
import controllor.action.qnaboard.AdminQnaBoardReplyView;
import controllor.action.qnaboard.QnaBoardAddAction;
import controllor.action.qnaboard.QnaBoardDeleteAction;
import controllor.action.qnaboard.QnaBoardDeleteCheckView;
import controllor.action.qnaboard.QnaBoardDetailAction;
import controllor.action.qnaboard.QnaBoardListAction;
import controllor.action.qnaboard.QnaBoardModifyAction;
import controllor.action.qnaboard.QnaBoardModifyView;
import controllor.action.qnaboard.QnaBoardReplyAction;
import controllor.action.qnaboard.QnaBoardReplyView;
import controllor.action.reserv.AdminGotoShowreserv;
import controllor.action.reserv.AdminReservAddAction;
import controllor.action.reserv.AdminReservListAction;
import controllor.action.reserv.AdminReservRemoveAction;
import controllor.action.reserv.Myreservinfo;
import controllor.action.reserv.ReservAddAction;
import controllor.action.reserv.ReservRemoveAction;
import controllor.action.reserv.ReservUpdateAction;
import controllor.action.reviewboard.AdminCommentAddAction;
import controllor.action.reviewboard.AdminCommentDeleteAction;
import controllor.action.reviewboard.AdminReviewAddAction;
import controllor.action.reviewboard.AdminReviewDeleteAction;
import controllor.action.reviewboard.AdminReviewListAction;
import controllor.action.reviewboard.AdminReviewUpdateAction;
import controllor.action.reviewboard.AdminReviewUpdateViewAction;
import controllor.action.reviewboard.ReviewBoardAddAction;
import controllor.action.reviewboard.ReviewBoardDeleteAction;
import controllor.action.reviewboard.ReviewBoardDeleteCheckView;
import controllor.action.reviewboard.ReviewBoardDetailAction;
import controllor.action.reviewboard.ReviewBoardListAction;
import controllor.action.reviewboard.ReviewBoardModifyAction;
import controllor.action.reviewboard.ReviewBoardModifyView;
import controllor.action.reviewboard.ReviewCommentAddAction;
import controllor.action.reviewboard.ReviewCommentDeleteAction;

public class Hotel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Hotel() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		Action action = null;
		ActionForward forward = null;

		// URI확인
//		System.out.println(command);

		if (command.equals("/adminlogin.ro")) {
			action = new AdminLoginAction();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		} 
		else if (command.equals("/myinfo.ro")) {
			action = new Myinfo();
			try { forward = action.execute(request, response); } 
			catch (Exception e) { e.printStackTrace(); }
		} 
		else if (command.equals("/myreservinfo.ro")) {
			action = new Myreservinfo();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/userlogout.ro")) {
			action = new UserLogout();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/adminloginsuccess.ro")) {
			action = new AdminLoginsuccessAction();
			try { forward = action.execute(request, response); } 
			catch (Exception e) { e.printStackTrace(); }
		} 
		else if (command.equals("/memberUpdate.ro")) {
			action = new AdminUpdateMember();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/administration/AdminMemberUpdateView.ro")) {
			action = new AdminGotoShowMemberInsert();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/consumer/login.ro")) {
			action = new LoginAction();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/consumer/region.ro")) {
			action = new RegionAction();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/showreserv.ro")) {
			action = new AdminGotoShowreserv();
			try { forward = action.execute(request, response); } 
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/showmembre.ro")) {
			action = new AdminGotoShowmember();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/memberinfoupdate.ro")) {
			action = new MemberInfoUpdate();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/userInformation.ro")) {
			action = new UserInformation();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/consumermemberupdate.ro")) {
			action = new ConsumerUpdateMember();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/memberpwquestion.ro")) {
			action = new UserPwQuestion();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/adminmemberdelete.ro")) {
			action = new AdminMemberDelete();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/withdrawal.ro")) {
			action = new ShowGotoMemberDelete();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		} 
		else if (command.equals("/memberdeletequestion.ro")) {
			action = new MemberDelete();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}
		else if (command.equals("/memberListviews.ro")) {
			action = new MemberListAction();
			try { forward = action.execute(request, response); }
			catch (Exception e) { e.printStackTrace(); }
		}

		// 예약담당
		else if (command.equals("/adminReservListAction.res")) {
			action = new AdminReservAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/adminReservAddAction.res")) {
			action = new AdminReservAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReservAddAction.res")) {
			action = new ReservAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/adminReservRemoveAction.res")) {
			action = new AdminReservRemoveAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReservRemoveAction.res")) {
			action = new ReservRemoveAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReservUpdateAction.res")) {
			action = new ReservUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReservList.res")) {
			System.out.println("ReservList에 진입");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./administration/adminReservListView.jsp");
		} else if (command.equals("/reservinfo.res")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./consumer/reservInformation.jsp");
		} else if (command.equals("/reserve.res")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./consumer/reserveAddView.jsp?room=");
		} else if (command.equals("/reservedeluxe.res")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./consumer/reserveAddView.jsp?room=deluxe");
		} else if (command.equals("/reservesweet.res")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./consumer/reserveAddView.jsp?room=sweet");
		} else if (command.equals("/reservefamily.res")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./consumer/reserveAddView.jsp?room=family");
		} else if (command.equals("/adminReservListviews.res")) {
			action = new AdminReservListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 이벤트보드 시작 관리자@@@@@@
		else if (command.equals("/AdminEventListAction.ro")) {
			action = new AdminEventListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

//검색 실험중
/*
		 else if (command.equals("/AdminShowEvent.ro")) {
		    	action = new AdminShowEvent();
				try { forward = action.execute(request, response); }
				catch (Exception e) { e.printStackTrace(); }
			}
		
*/
		// 글쓰기 넘어가기
		else if (command.equals("/AdminEventWrite.ro")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./administration/admin_eventwrite.jsp");
		}
		// add 액션이랑 boardwrite 수정
		// 글을 쓰고 난후 첨부해서 넘김./AdminEventAddAction.ro
		else if (command.equals("/AdminEventAddAction.ro")) {
			action = new AdminEventAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 이벤트 업데이트 뷰 넘길때 사용
		else if (command.equals("/AdminEventUpdateView.ro")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./administration/admin_eventupdate.jsp");
		}
		//
		else if (command.equals("/AdminEventUpdateAction.ro")) {
			action = new AdminEventUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminEventDeleteAction.ro")) {
			action = new AdminEventDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 이벤트게시판 회원용@@@@
		else if (command.equals("/EventListAction.ro")) {
			action = new EventListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/EventDetailAction.ro")) {
			action = new EventDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/EventAction.ro")) {
			action = new EventAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// 리뷰moon
		// 리뷰 유저용
		// 여기부터 내가 추가하는 부분@@@@@
		else if (command.equals("/ReviewBoardListAction.ro")) {
			action = new ReviewBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewBoardDetailAction.ro")) {
			action = new ReviewBoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/ReviewBoardDeleteAction.ro")) {
			action = new ReviewBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewBoardModify.ro")) {
			action = new ReviewBoardModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/ReviewBoardModifyAction.ro")) {
			action = new ReviewBoardModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // 글쓰기 넘어가기
		else if (command.equals("/ReviewBoardWrite.ro")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./consumer/review_board_write.jsp");
		}

		else if (command.equals("/ReviewBoardDeleteCheckView.ro")) {
			action = new ReviewBoardDeleteCheckView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// add 액션이랑 boardwrite 수정
		// 글을 쓰고 난후 첨부해서 넘김
		else if (command.equals("/ReviewBoardAddAction.ro")) {
			action = new ReviewBoardAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewCommentAddAction.ro")) {
			action = new ReviewCommentAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/ReviewCommentDeleteAction.ro")) {
			action = new ReviewCommentDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 리뷰 관리자용 @@@@AdminReviewListAction
		else if (command.equals("/AdminReviewListAction.ro")) {
			action = new AdminReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 글쓰기 넘어가기AdminReviewWrite
		else if (command.equals("/AdminReviewWrite.ro")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./administration/admin_reviewwrite.jsp");
		}
		// add 액션이랑 boardwrite 수정
		// 글을 쓰고 난후 첨부해서 넘김./AdminEventAddAction.roAdminReviewAddAction
		else if (command.equals("/AdminReviewAddAction.ro")) {
			action = new AdminReviewAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 이벤트 업데이트 뷰 넘길때 사용 @@어쩔수 없이 액션
		else if (command.equals("/AdminReviewUpdateViewAction.ro")) {
			action = new AdminReviewUpdateViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		//
		else if (command.equals("/AdminReviewUpdateAction.ro")) {
			action = new AdminReviewUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/AdminReviewDeleteAction.ro")) {
			action = new AdminReviewDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// admincomment 처리AdminCommentAddAction
		else if (command.equals("/AdminCommentAddAction.ro")) {
			action = new AdminCommentAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminCommentDeleteAction.ro")) {
			action = new AdminCommentDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 끝 페이징 묶음 이랑 이동시 페이지넘버 같이 보내기@@@@
		// 이벤트 회원정보용 페이지 @@@@@@@@
		else if (command.equals("/EventCheckInfo.ro")) {
			action = new EventCheckInfo();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 이벤트 삭제 액션
		else if (command.equals("/EventCheckDeleteAction.ro")) {
			action = new EventCheckDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 여기부터 내가 추가하는 부분@@@@@ㅙㅗ
		else if (command.equals("/NoticeBoardListAction.ro")) {
			action = new NoticeBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NoticeBoardDetailAction.ro")) {
			action = new NoticeBoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/NoticeBoardDeleteAction.ro")) {
			action = new NoticeBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NoticeBoardModify.ro")) {
			action = new NoticeBoardModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/NoticeBoardModifyAction.ro")) {
			action = new NoticeBoardModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // 글쓰기 넘어가기
		else if (command.equals("/NoticeBoardWrite.ro")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./consumer/notice_board_write.jsp");
		}

		else if (command.equals("/NoticeBoardDeleteCheckView.ro")) {
			action = new NoticeBoardDeleteCheckView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// add 액션이랑 boardwrite 수정
		// 글을 쓰고 난후 첨부해서 넘김
		else if (command.equals("/NoticeBoardAddAction.ro")) {
			action = new NoticeBoardAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// notice관리자

		// 여기부터 내가 추가하는 부분@@@@@ㅙㅗ
		else if (command.equals("/AdminNoticeBoardListAction.ro")) {
			action = new AdminNoticeBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminNoticeBoardDetailAction.ro")) {
			action = new AdminNoticeBoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/AdminNoticeBoardDeleteAction.ro")) {
			action = new AdminNoticeBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminNoticeBoardModify.ro")) {
			action = new AdminNoticeBoardModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/AdminNoticeBoardModifyAction.ro")) {
			action = new AdminNoticeBoardModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // 글쓰기 넘어가기
		else if (command.equals("/AdminNoticeWrite.ro")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./administration/admin_notice_board_write.jsp");
		}

		else if (command.equals("/AdminNoticeBoardDeleteCheckView.ro")) {
			action = new AdminNoticeBoardDeleteCheckView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// add 액션이랑 boardwrite 수정
		// 글을 쓰고 난후 첨부해서 넘김
		else if (command.equals("/AdminNoticeBoardAddAction.ro")) {
			action = new AdminNoticeBoardAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaBoardListAction.ro")) {
			action = new QnaBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaBoardDetailAction.ro")) {
			action = new QnaBoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/QnaBoardDeleteAction.ro")) {
			action = new QnaBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaBoardModifyView.ro")) {
			action = new QnaBoardModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/QnaBoardModifyAction.ro")) {
			action = new QnaBoardModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // 글쓰기 넘어가기
		else if (command.equals("/QnaBoardWrite.ro")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./consumer/qna_board_write.jsp");
		} else if (command.equals("/QnaBoardReplyView.ro")) {
			action = new QnaBoardReplyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/QnaBoardReplyAction.ro")) {
			action = new QnaBoardReplyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/QnaBoardDeleteCheckView.ro")) {
			action = new QnaBoardDeleteCheckView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		else if (command.equals("/QnaBoardAddAction.ro")) {
			action = new QnaBoardAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		// add 액션이랑 boardwrite 수정
		// 글을 쓰고 난후 첨부해서 넘김
		else if (command.equals("/AdminQnaBoardAddAction.ro")) {
			action = new AdminQnaBoardAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminQnaBoardListAction.ro")) {
			action = new AdminQnaBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminQnaBoardDetailAction.ro")) {
			action = new AdminQnaBoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (command.equals("/AdminQnaBoardDeleteAction.ro")) {
			action = new AdminQnaBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminQnaBoardModifyView.ro")) {
			action = new AdminQnaBoardModifyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/AdminQnaBoardModifyAction.ro")) {
			action = new AdminQnaBoardModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // 글쓰기 넘어가기
		else if (command.equals("/AdminQnaBoardWrite.ro")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setUrl("./administration/admin_qna_board_write.jsp");
		} else if (command.equals("/AdminQnaBoardReplyView.ro")) {
			action = new AdminQnaBoardReplyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/AdminQnaBoardReplyAction.ro")) {
			action = new AdminQnaBoardReplyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/AdminQnaBoardDeleteCheckView.ro")) {
			action = new AdminQnaBoardDeleteCheckView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		else if (command.equals("/AdminQnaBoardReply.ro")) {
			action = new AdminQnaBoardReplyView();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// add 액션이랑 boardwrite 수정
		// 글을 쓰고 난후 첨부해서 넘김
		

		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getUrl());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getUrl());
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
