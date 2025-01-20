package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.PageDAO;
import com.entity.Page;

@Controller
@RequestMapping("/pageMng")
public class PageController {

    private final PageDAO pageDAO;

    @Autowired
    public PageController(PageDAO pageDAO) {
        this.pageDAO = pageDAO;
    }

    @GetMapping("/pages")
    public List<Page> getAllPages() {
        return pageDAO.findAll();
    }
}
