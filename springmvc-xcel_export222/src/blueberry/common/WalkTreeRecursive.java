package blueberry.common;

/*
   Copyright 2013, 2014 Dominik Stadler
   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at
     http://www.apache.org/licenses/LICENSE-2.0
   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
 */

import org.dstadler.jgit.helper.CookbookHelper;
import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.internal.storage.file.FileRepository;
import org.eclipse.jgit.lib.Ref;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.revwalk.RevCommit;
import org.eclipse.jgit.revwalk.RevTree;
import org.eclipse.jgit.revwalk.RevWalk;
import org.eclipse.jgit.treewalk.TreeWalk;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Note: This snippet is not done and likely does not show anything useful yet
 *
 * Simple snippet which shows how to use RevWalk to iterate over items in a file-tree
 *
 * @author dominik.stadler at gmx.at
 */
public class WalkTreeRecursive {

    public static void main(String[] args) throws IOException {
        

        
        try (
                
                //Repository repository = CookbookHelper.openJGitCookbookRepository()
                
                Repository repository = new FileRepository("C:\\Users\\kyungjoon.go\\AppData\\Local\\Temp\\kyungjoonRepo4637061361195108864\\" + ".git");
                
                ) {
            Ref head = repository.findRef("HEAD");
            
            List arrList=new ArrayList();

            // a RevWalk allows to walk over commits based on some filtering that is defined
            try (RevWalk walk = new RevWalk(repository)) {
                RevCommit commit = walk.parseCommit(head.getObjectId());
                RevTree tree = commit.getTree();
                System.out.println("Having tree: " + tree);

                // now use a TreeWalk to iterate over all files in the Tree recursively
                // you can set Filters to narrow down the results if needed
                try (TreeWalk treeWalk = new TreeWalk(repository)) {
                    treeWalk.addTree(tree);
                    treeWalk.setRecursive(true);
                    while (treeWalk.next()) {
                        
                        int depth = treeWalk.getDepth();
                        System.out.println(treeWalk.getDepth());
                       // if ( treeWalk.getDepth() == 0 )
                        
                        if (treeWalk.getPathString().contains("myvenv4") && depth==1 ){
                            System.out.println("found: " + treeWalk.getPathString());
                            HashMap value=new HashMap();
                            
                            value.put("type", "file");
                            value.put("name", treeWalk.getPathString());
                            value.put("debpt", treeWalk.getDepth());
                            
                            arrList.add(value);
                        }
                            
                    }
                }
                try(TreeWalk treeWalk = new TreeWalk(repository)){
                        
                    treeWalk.addTree(tree);
                    treeWalk.setRecursive(false);
                    while (treeWalk.next()) {
                        
                        int depth = treeWalk.getDepth();
                    
                        
                            if (treeWalk.isSubtree()) {
                                
                               // 
                              // 
                                    
                                    
                                    treeWalk.enterSubtree();
                                    
                                    if (treeWalk.getPathString().contains("myvenv4") && depth==1 ){
                                        System.out.println("dir: " + treeWalk.getDepth());
                                        System.out.println("dir: " + treeWalk.getPathString());
                                        
                                        
                                        HashMap value=new HashMap();
                                        
                                        value.put("type", "dir");
                                        value.put("name", treeWalk.getPathString());
                                        value.put("debpt", treeWalk.getDepth());
                                        
                                        arrList.add(value);
                                        
                                    }
                              //  
                               // }    
                        }
                    }
                    
                }
            }
            
            System.out.println(arrList.toString());
        }
    }
}