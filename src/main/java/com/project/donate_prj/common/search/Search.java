package com.project.donate_prj.common.search;

import com.project.donate_prj.common.paging.Page;
import lombok.*;

@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
public class Search extends Page {

    private String keyword;

}
