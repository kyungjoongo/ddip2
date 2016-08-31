package blueberry.temp;

import java.io.File;
import java.io.IOException;

import org.eclipse.jgit.lib.Ref;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.revwalk.RevCommit;
import org.eclipse.jgit.revwalk.RevTree;
import org.eclipse.jgit.revwalk.RevWalk;
import org.eclipse.jgit.storage.file.FileRepositoryBuilder;
import org.eclipse.jgit.treewalk.TreeWalk;

public class WalkTreeRecursive2 {

    /**
     * @param args
     * @throws IOException
     */
    public static void main(String[] args) throws IOException {

        FileRepositoryBuilder builder = new FileRepositoryBuilder();

        Repository repository = builder.setGitDir(new File("C:\\Users\\kyungjoon.go\\AppData\\Local\\Temp\\kyungjoonRepo4637061361195108864\\.git")).readEnvironment().findGitDir().build();

        listRepositoryContents(repository);

        // Close repo
        repository.close();

    }

    private static void listRepositoryContents(Repository repository) throws IOException {

        Ref head = repository.getRef("HEAD");

        // a RevWalk allows to walk over commits based on some filtering that is
        // defined
        RevWalk walk = new RevWalk(repository);

        RevCommit commit = walk.parseCommit(head.getObjectId());
        RevTree tree = commit.getTree();
        System.out.println("Having tree: " + tree);

        // now use a TreeWalk to iterate over all files in the Tree recursively
        // you can set Filters to narrow down the results if needed
     /*   TreeWalk treeWalk = new TreeWalk(repository);
        treeWalk.addTree(tree);
        treeWalk.setRecursive(true);
        while (treeWalk.next()) {
            System.out.println("found: " + treeWalk.getPathString());
        }
*/
        
        TreeWalk treeWalk = new TreeWalk(repository);
        treeWalk.addTree(tree);
        treeWalk.setRecursive(false);
        while (treeWalk.next()) {
            if (treeWalk.isSubtree()) {
                System.out.println("dir: " + treeWalk.getPathString());
                treeWalk.enterSubtree();
            } else {
                System.out.println("file: " + treeWalk.getPathString());
            }
        }
    }

}