package com.javarush.test.controller;

import com.javarush.test.domen.Part;
import com.javarush.test.domen.SortTypes;
import com.javarush.test.repos.PartRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class MainController {
    @Autowired
    PartRepo partRepo;

    private SortTypes sortType = SortTypes.ALL;

    @GetMapping("/")
    public String getMainPage(){
        return "mainPage";
    }

    @GetMapping("/listParts/{page}")
    public String getListParts(@RequestParam(required = false, defaultValue = "") String name,
                               @PathVariable Integer page,
                               Model model){

        String title = new String();
        List<Part> result = new ArrayList<>();

        if(!Objects.isNull(name) && !name.isEmpty()){
            title = "Найденные комплектующие";
            result = partRepo.findByName(name);
        }else {
            title = "Список комплектующих, страница "+page;
            if(sortType == SortTypes.ALL)
                result = (List) partRepo.findAll();
            else if (sortType == SortTypes.NECESSARY)
                result = partRepo.findByNecessary(true);
            else if (sortType == SortTypes.OPTION)
                result = partRepo.findByNecessary(false);
        }

        PageMap pageMap = new PageMap(result);
        List<Part> allParts = partRepo.findByNecessary(true);

        int countPc = allParts.stream().mapToInt(p -> p.getQuantity()).min().getAsInt();

        model.addAttribute("title", title);
        model.addAttribute("parts", pageMap.get(page) == null?Collections.EMPTY_LIST:pageMap.get(page));
        model.addAttribute("filter", name);
        model.addAttribute("pages", pageMap.keySet());
        model.addAttribute("defPage", page);
        model.addAttribute("countPc", countPc);
        return "subPage";
    }

    @GetMapping("/edit/{part}")
    public String editData(@PathVariable Part part, Model model){
        model.addAttribute("name", part.getName());
        model.addAttribute("checked" , part.getNecessary().equals("да")?"true":"");
        model.addAttribute("quantity", part.getQuantity());
        model.addAttribute("id", part.getId());
        return "editPage";
    }

    @GetMapping("/delete/{part}")
    public String deleteData(@PathVariable Part part){
        partRepo.delete(part);
        return "redirect:/listParts/1";
    }

    @PostMapping("/makeChanges/{part}")
    public String saveData(@RequestParam(required = true) String name,
                           @RequestParam(required = false) Boolean necessary,
                           @RequestParam(required = false) Integer quantity,
                           @PathVariable Part part){
        if (part != null){
            part.setName(name);
            part.setNecessary(necessary==null?false:necessary);
            part.setQuantity(quantity);
            partRepo.save(part);
        }

        return "redirect:/listParts/1";
    }

    @PostMapping("/addNew")
    public String addData(Part part){
        if(part.getName() != null && !part.getName().isEmpty()){
            try {
                part.getNecessary();
            }catch (NullPointerException e){
                part.setNecessary(false);
            }
            partRepo.save(part);
        }
        return "redirect:/listParts/1";
    }

    @GetMapping("/addPage")
    public String openAddPage(){
        return "addPage";
    }

    @GetMapping("/allSort")
    public String setAllSort(){
        sortType = SortTypes.ALL;
        return "redirect:/listParts/1";
    }

    @GetMapping("/necessary")
    public String setNecessarySort(){
        sortType = SortTypes.NECESSARY;
        return "redirect:/listParts/1";
    }

    @GetMapping("/option")
    public String setOptionSort(){
        sortType = SortTypes.OPTION;
        return "redirect:/listParts/1";
    }

    class PageMap extends HashMap<Integer, List>{

        public PageMap(List list) {

            if (list != null){
                int resSize = list.size();
                int rem = resSize % 10;
                int pageCount = (resSize / 10) + (rem > 0 ? 1 : 0);

                for (int i = 1; i <= pageCount; i++){
                    int s = (i-1)*10;
                    put(i, list.subList(s, i==pageCount?s+rem:s+10));
                }

            }
        }

    }

  }

