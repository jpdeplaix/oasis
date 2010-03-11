
(** Run test for OASIS
    @author Sylvain Le Gall
  *)

open OUnit;;
open TestCommon;;
open OASISBuiltinPlugins;;

let _res: test_result list = 
  let ctxt =
    {
      dbug = false;
      has_ocamlopt = 
        (
          try 
            let _s : FilePath.filename = 
              FileUtil.which "ocamlopt"
            in
              true
          with Not_found ->
            false
        );
      oasis =
        FilePath.concat
          (FileUtil.pwd ())
          "../_build/src/OASIS.byte";
      oasis_args = [];
    }
  in
    run_test_tt_main
      ("OASIS">:::
       [
         TestPropList.tests     ctxt;
         TestOASIS.tests        ctxt;
         TestVersion.tests      ctxt;
         TestFileGenerate.tests ctxt;
         TestBasic.tests        ctxt;
         TestFull.tests         ctxt;
         TestMETA.tests         ctxt;
       ])
;;
