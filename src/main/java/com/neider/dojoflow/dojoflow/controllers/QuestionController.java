package com.neider.dojoflow.dojoflow.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.neider.dojoflow.dojoflow.models.Answer;
import com.neider.dojoflow.dojoflow.models.Question;
import com.neider.dojoflow.dojoflow.models.Tag;
import com.neider.dojoflow.dojoflow.services.AnswerServices;
import com.neider.dojoflow.dojoflow.services.QuestionServices;
import com.neider.dojoflow.dojoflow.services.TagServices;

import jakarta.validation.Valid;

@Controller
public class QuestionController {

    @Autowired private AnswerServices answerServices;
    @Autowired private QuestionServices questionServices;
    @Autowired private TagServices tagServices;
    
    private List<String> separateTagsByCommas(Set<Tag> tags) {
        List<String> tagNames = new ArrayList<>();
        for (Tag tag : tags) {
            String[] words = tag.getSubject().split(",\\s*");

            tagNames.addAll(Arrays.asList(words)); 
        }
        return tagNames;
    }

    @GetMapping("/questions")
    String questions(Model model){

        model.addAttribute("questions", questionServices.findAll());
        return "questions.jsp";
    }

    @GetMapping("/questions/new")
    String creationQuestionPage(@ModelAttribute("questiontag") Question questionModel){
        return "createQuestion.jsp";
    }

    @PostMapping("/questions/new")
    String creationQuestion(
        @Valid @ModelAttribute("questiontag") Question questionModel,
        BindingResult result,
        @RequestParam(value = "etiquetas") String tagsValue
    ){
        if(result.hasErrors()){
            return "createQuestion.jsp";
        }

        Tag newTags = new Tag();
        newTags.setSubject(tagsValue);
        tagServices.save(newTags);
        
        Set<Tag> tagsQ = new HashSet<>();
        tagsQ.add(newTags);
        questionModel.setTags(tagsQ);
        questionServices.save(questionModel);
        
        return "redirect:/questions/new";
    }

    @GetMapping("/questions/{idfilterq}")
    String filterQuestions(
        @PathVariable("idfilterq") Long idQuestion,
        @ModelAttribute("answerQ") Answer answer,
        Model model
    ){
        Question questionS = questionServices.findById(idQuestion);
        
        if (questionS != null) {
            List<Answer> answers = new ArrayList<>(questionS.getAnswers());
            List<Answer> limitedAnswers = answers.stream().limit(4).collect(Collectors.toList());

            
            List<String> tagsSet = separateTagsByCommas(questionS.getTags());

            model.addAttribute("tags", tagsSet);
            model.addAttribute("question", questionS);
            model.addAttribute("answers", limitedAnswers);
            return "questionFilter.jsp"; // answers.jsp
        } else {
            return "redirect:/questions/new";
        }
    }

    @PostMapping("/questions/{idquestion}/new")
    String createAnswer(
        @PathVariable("idquestion") Long idquestion,
        @ModelAttribute("answerQ") Answer answer
    ){
        Question questionAnswer = questionServices.findById(idquestion);
        answer.setQuestion(questionAnswer);
        answerServices.save(answer);
        return "redirect:/questions/" + idquestion ;
    }

}
