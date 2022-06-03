package com.portfolio.controller;

import com.portfolio.domain.CategoryVO;
import com.portfolio.domain.QuestionVO;
import com.portfolio.service.AnswerService;
import com.portfolio.service.QuestionService;
import com.portfolio.service.QuestionImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("question")
public class QuestionController {

    @Autowired
    QuestionService questionService;

    @Autowired
    AnswerService answerService;

    @Autowired
    QuestionImageService imageService;

    @PostMapping("create")
    public String createQuestion(QuestionVO questionVO, Principal principal, Model model) {

        questionVO.setUserEmail(principal.getName());

        // 기존 질문 리스트 조회
        List<QuestionVO> questions = questionService.selectList(new QuestionVO());

        questionService.create(questionVO);

        // 새로 생성된 질문글
        QuestionVO question = questionService.select(questionVO.getQuesNo());

        // 기존 질문 리스트의 첫번째 질문에 새로 생성된 질문글 추가
        questions.add(0, question);

        // 질문 하나가 추가되었으므로 기존 질문 리스트에서 질문 한개 삭제
        if(questions.size() > 10) {
            questions.remove(questions.size() - 1);
        }

        model.addAttribute("questions", questions);

        model.addAttribute("categories", questionService.selectCategories());

        return "redirect:/questions";
    }

//    @RequestMapping("/{postNo}")
//    public String viewQuestion(@PathVariable int postNo, Model model) {
//        QuestionVO question = questionService.read(postNo);
//
//        List<AnswerVO> answers = answerService.readList(postNo);
//
//        model.addAttribute("question", question);
//        model.addAttribute("answers", answers);
////        model.addAttribute("files", files);
//
//        return "viewQuestion";
//    }

    @GetMapping("{quesNo}")
    public String viewQuestion(@PathVariable int quesNo, Model model) {

        QuestionVO question = questionService.select(quesNo);

        // 답변여부에 따라 답변글 조회
        if (question.getAnswered().equals("Y")) {

            HashMap<String, Integer> map = new HashMap<>();

            map.put("quesNo", quesNo);

            // 더불러오기용 마지막 답변글 번호
            map.put("ansNo", null);

            // 답변 리스트
            model.addAttribute("answers", answerService.selectAnswers(map));

        }

        model.addAttribute("question", question);

        return "detailQuestion";

    }

//    @GetMapping(value="edit/{postNo}") //, produces="application/json"
//    @ResponseBody
//    public QuestionVO editQuestion(@PathVariable int postNo) {
//        return questionService.read(postNo);
//
//    }

//    @PostMapping("edit/")
//    @ResponseBody
//    public QuestionVO editQuestion(HttpServletRequest request, QuestionVO question, Principal principal) {
//
//        List<ImageVO> imgVOList = imageService.readAll(question.getQuesNo());
//
//        for (ImageVO imgVO : imgVOList) {
//
//            System.out.println("기존 업로드 파일 경로:" + imgVO.getUploadPath());
//
//        }
//
//        UploadFileUtils.deleteFile(request, imgVOList);
//
//        questionService.update(question);
//
//        return questionService.read(question.getQuesNo());
//    }

//    @RequestMapping("delete/{postNo}")
//    public String deleteQuestion(HttpServletRequest request, @PathVariable int postNo) {
//
//        questionService.delete(postNo);
//
//        // 삭제하려는 게시글의 모든 첨부파일(이미지) 불러오기
//        List<ImageVO> atchList = imageService.readAll(postNo);
//
//        // 파일관련유틸에 절대경로를 얻기위한 HttpServletRequest 객체, 삭제할 파일 리스트 전달하여 파일삭제
//        UploadFileUtils.deleteFile(request, atchList);
//
//        // 첨부파일 리스트 순회하며 데이터베이스에서 삭제
//        for (ImageVO atch : atchList) {
//            imageService.delete(atch);
//        }
//
//        return "index";
//    }

    @GetMapping("categories")
    @ResponseBody
    public List<CategoryVO> getCategories() {

        return questionService.selectCategories();
    }

}
