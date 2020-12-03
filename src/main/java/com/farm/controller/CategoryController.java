package com.farm.controller;

import com.farm.pojo.Category;
import com.farm.pojo.Page;
import com.farm.pojo.SecondCategory;
import com.farm.service.CategoryService;
import com.farm.service.SecondCategoryService;
import com.farm.util.ImageUtil;
import com.farm.util.UploadedImageFile;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    SecondCategoryService secondCategoryService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("admin_category_list")//管理员查询三级分类
    public String list(Model model,  int sid, Page page){
        SecondCategory sc=secondCategoryService.get(sid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Category> cs=categoryService.list(sid);
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        page.setParam("&sid="+sc.getId());
        model.addAttribute("cs", cs);
        model.addAttribute("sc", sc);
        model.addAttribute("page", page);
        return "admin/listCategory";
    }

    @RequestMapping("admin_category_add")//管理员添加三级分类
    public String add(Category c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
        System.out.println(c.getId());
        categoryService.add(c);
        System.out.println(c.getId());
        File  imageFolder= new File(session.getServletContext().getRealPath("img/category"));
        File file = new File(imageFolder,c.getId()+".jpg");
        if(!file.getParentFile().exists())
            file.getParentFile().mkdirs();
        System.out.println(uploadedImageFile);
        System.out.println(uploadedImageFile.getImage());
        System.out.println(file);
        uploadedImageFile.getImage().transferTo(file);
        BufferedImage img = ImageUtil.change2jpg(file);
        ImageIO.write(img, "jpg", file);
        return "redirect:/admin_category_list?sid="+c.getSid();
    }

    @RequestMapping("admin_category_delete")//管理员删除三级分类
    public String delete(int id,HttpSession session) throws IOException {
        Category c=categoryService.get(id);
        categoryService.delete(id);
        File  imageFolder= new File(session.getServletContext().getRealPath("img/category"));
        File file = new File(imageFolder,id+".jpg");
        file.delete();
        return "redirect:/admin_category_list?sid="+c.getSid();
    }

    @RequestMapping("admin_category_edit")//管理员编辑三级分类
    public String get(int id,Model model) throws IOException{
        Category category=categoryService.get(id);
        model.addAttribute("c",category);
        return "admin/editCategory";
    }

    @RequestMapping("admin_category_update")//管理员修改三级分类
    public String update(Category c, HttpSession session, UploadedImageFile uploadedImageFile) throws IOException {
        categoryService.update(c);
        MultipartFile image = uploadedImageFile.getImage();
        if(null!=image &&!image.isEmpty()){
            File  imageFolder= new File(session.getServletContext().getRealPath("img/category"));
            File file = new File(imageFolder,c.getId()+".jpg");
            image.transferTo(file);
            BufferedImage img = ImageUtil.change2jpg(file);
            ImageIO.write(img, "jpg", file);
        }
        return "redirect:/admin_category_list?sid="+c.getSid();
    }

    @RequestMapping("userBack_category_list")//用户查询三级分类
    public String listBack(Model model,  int sid, Page page){
        SecondCategory sc=secondCategoryService.get(sid);
        PageHelper.offsetPage(page.getStart(),page.getCount());
        List<Category> cs=categoryService.list(sid);
        int total = (int) new PageInfo<>(cs).getTotal();
        page.setTotal(total);
        page.setParam("&sid="+sc.getId());
        model.addAttribute("cs", cs);
        model.addAttribute("sc", sc);
        model.addAttribute("page", page);
        return "userBack/listCategory";
    }
}
