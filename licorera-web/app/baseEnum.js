var baseEnum = {
    sizeBootstrap: {
        small: "sm",
        medium: "md",
        large: "lg",
    },
    GeneralParams: {
        NoAplica: "N/A",
        UrlPaginaInicio: "/SitePages/Bandeja.aspx#!/MiPagina.aspx",
    },
    TypeProcessRequest: {
        getRequest: { id: 1, method: "GET" },
        postRequest: { id: 2, method: "POST" },
        updateRequest: { id: 3, method: "PATCH" },
        deleteRequest: { id: 4, method: "DELETE" },
        fileUploadRequest: { id: 5, method: "POST" },
        sendEmail: { id: 6, method: "POST" },
        checkInFile: { id: 7, method: "POST"}
    },
    ProcessStatus: {
    },
    Messages: {
        Information: "Información",
        Error: "Error",
        Warning: "Alerta",
        FormInvalidate: "El formulario tiene campos invalidos",
        ItemDuplicated: "El elemento ya se encuentra en la lista",
        ErrorServer: "Error Desde Servidor: ",
        ErrorService: "Error en catch del servicio: ",
        LoadingModal: "Procesando...",
        VerificationForm: "Por favor verifique que los datos son correctos. En caso contrario, haga clic en 'Editar'",
        SuccessProcess: "Proceso ejecutado correctamente.",
        ErrorProcess: "Ha ocurrido un error al cargar la información, por favor refresque la pagina e intente nuevamente, si el problema persiste contacte al administrador del sistema",
        ErrorProcessSaving: "Error guardando la información. Contacte al administrador.",
        SuceessfulSavedFile: "Archivo guardado exitosamente",
        PreDeleteElement: "¿Está seguro de desea eliminar el elemento seleccionado?"
    },
    ResourcerBase: {
        //UrlLogoPng: "/sites/registroyacreditacion-qas/Style%20Library/uExternado/img/logo.png",
        UrlImageLoading: "/lib/Images/default.gif",
        UrlModalTemplate: "../App/ng-dev/pages/templates/ModalTemplate.html",
        UrlModalTemplateReturn: "../App/ng-dev/pages/templates/ModalInformacionReturn.html",
        UrlModalFormTemplate: "../App/ng-dev/pages/templates/ModalFormTemplate.html",
        UrlModalConfirm: "../App/ng-dev/pages/templates/ModalConfirm.html"
    },
    ListNames: {
        Eventos: "Eventos"
    },
    UrlHR:{
        Logo:""
    }
}
